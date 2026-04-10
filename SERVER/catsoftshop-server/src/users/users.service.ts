import { Injectable, Inject, InternalServerErrorException, NotFoundException } from '@nestjs/common';
import * as admin from 'firebase-admin';

@Injectable()
export class UsersService {
    // 1. Declare the type but don't assign it yet
    private db: admin.firestore.Firestore;

    // 2. Use the constructor to inject the initialized app
    constructor(@Inject('FIREBASE_APP') private firebaseApp: admin.app.App) {
        // 3. Now initialize the db safely
        this.db = this.firebaseApp.firestore();
    }

    async createUser(userData: any, file?: Express.Multer.File) {
    try {
      let profilePicUrl = '';

      // 1. Handle Image Upload if a file exists
      if (file) {
        const bucket = admin.storage().bucket();
        const fileName = `user_profiles/${userData.uid}_${Date.now()}.jpg`;
        const blob = bucket.file(fileName);

        await blob.save(file.buffer, {
          contentType: file.mimetype,
          resumable: false,
        });

        // Construct the public URL (ensure your bucket has public read access or use signed URLs)
        profilePicUrl = `https://storage.googleapis.com/${bucket.name}/${fileName}`;
      }

      // 2. Save to Firestore using the UID as the Document ID
      const userPayload = {
        ...userData,
        profilePic: profilePicUrl,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      };

      await this.db.collection('USERS').doc(userData.uid).set(userPayload);

      return {
        id: userData.uid,
        status: 'User created successfully',
      };
    } catch (error) {
      // Friendly reminder: Ensure Firebase Admin is initialized before calling this
      throw new InternalServerErrorException(`Create user failed: ${error.message}`);
    }
  }

    async updateUser(id: string, userData: any) {
        try {
            const docRef = this.db.collection('USERS').doc(id);

            await docRef.update({
                ...userData,
                updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            });

            return {
                id: id,
                status: 'User profile updated'
            };
        } catch (error) {
            throw new InternalServerErrorException(`Update user failed: ${error.message}`);
        }
    }
    async deleteUser(id: string) {
        try {
            const docRef = this.db.collection('USERS').doc(id);

            await docRef.delete();

            return {
                id: id,
                status: 'User deleted successfully'
            };
        } catch (error) {
            throw new InternalServerErrorException(`Delete user failed: ${error.message}`);
        }
    }

    // GET ALL USERS
    async getAllUsers() {
        try {
            const snapshot = await this.db.collection('USERS').get();
            // Firestore returns a snapshot; we map it to get the data + the ID
            return snapshot.docs.map(doc => ({
                id: doc.id,
                ...doc.data()
            }));
        } catch (error) {
            throw new InternalServerErrorException(`Failed to fetch users: ${error.message}`);
        }
    }

    // GET USER BY ID
    async getUserById(id: string) {
        try {
            const doc = await this.db.collection('USERS').doc(id).get();

            if (!doc.exists) {
                throw new NotFoundException('User not found');
            }

            return {
                id: doc.id,
                ...doc.data()
            };
        } catch (error) {
            if (error instanceof NotFoundException) throw error;
            throw new InternalServerErrorException(`Error fetching user: ${error.message}`);
        }
    }

    async getUserByName(name: string) {
        try {
            // Query the collection for documents where the 'name' field matches
            const snapshot = await this.db.collection('USERS')
                .where('authorName', '==', name)
                .get();

            if (snapshot.empty) {
                throw new NotFoundException(`No user found with name: ${name}`);
            }

            // Return an array of matching users
            return snapshot.docs.map(doc => ({
                id: doc.id,
                ...doc.data()
            }));
        } catch (error) {
            if (error instanceof NotFoundException) throw error;
            throw new InternalServerErrorException(`Search failed: ${error.message}`);
        }
    }

}