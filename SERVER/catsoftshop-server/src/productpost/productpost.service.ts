import { Injectable, Inject, InternalServerErrorException, NotFoundException } from '@nestjs/common';
import * as admin from 'firebase-admin';

@Injectable()
export class ProductpostService {
    private db: admin.firestore.Firestore;

    constructor(@Inject('FIREBASE_APP') private firebaseApp: admin.app.App) {
        this.db = this.firebaseApp.firestore();
    }

    async createProductPost(productData: any) {
        try {
            // .add() automatically creates a unique ID and returns the document reference
            const docRef = await this.db.collection('PRODUCT-POST').add({
                ...productData,
                createdAt: admin.firestore.FieldValue.serverTimestamp(),
            });

            return {
                id: docRef.id, // This is your new unique ID
                status: 'Product created with unique ID'
            };
        } catch (error) {
            throw new InternalServerErrorException(error.message);
        }
    }

    async updateProductPost(id: string, productData: any) {
        try {
            const docRef = this.db.collection('PRODUCT-POST').doc(id);

            // .update() only modifies the fields passed in, leaving others untouched
            await docRef.update({
                ...productData,
                updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            });

            return {
                id: id,
                status: 'Product updated successfully'
            };
        } catch (error) {
            // If the ID doesn't exist, Firestore throws an error
            throw new InternalServerErrorException(`Update failed: ${error.message}`);
        }
    }

    async deleteProductPost(id: string) {
        try {
            const docRef = this.db.collection('PRODUCT-POST').doc(id);

            await docRef.delete();

            return {
                id: id,
                status: 'Product deleted successfully'
            };
        } catch (error) {
            throw new InternalServerErrorException(`Delete failed: ${error.message}`);
        }
    }

    // GET ALL POSTS
    async getAllPosts() {
        try {
            const snapshot = await this.db.collection('PRODUCT-POST').get();
            return snapshot.docs.map(doc => ({
                id: doc.id,
                ...doc.data()
            }));
        } catch (error) {
            throw new InternalServerErrorException(`Failed to fetch posts: ${error.message}`);
        }
    }

    // GET POST BY ID
    async getPostById(id: string) {
        try {
            const doc = await this.db.collection('PRODUCT-POST').doc(id).get();
            if (!doc.exists) throw new NotFoundException('Post not found');

            return {
                id: doc.id,
                ...doc.data()
            };
        } catch (error) {
            if (error instanceof NotFoundException) throw error;
            throw new InternalServerErrorException(`Error fetching post: ${error.message}`);
        }
    }

    async getPostByName(name: string) {
        try {
            const snapshot = await this.db.collection('PRODUCT-POST')
                .where('title', '==', name) // Ensure this field exists in your DB
                .get();

            if (snapshot.empty) {
                throw new NotFoundException(`No post found named: ${name}`);
            }

            return snapshot.docs.map(doc => ({
                id: doc.id,
                ...doc.data()
            }));
        } catch (error) {
            if (error instanceof NotFoundException) throw error;
            throw new InternalServerErrorException(`Search failed: ${error.message}`);
        }
    }

    // 6. FIND BY AUTHOR NAME
    async getPostsByAuthor(authorName: string) {
    try {
      // .where must match your DB field 'authorName' exactly
      const snapshot = await this.db
        .collection('PRODUCT-POST')
        .where('authorName', '==', authorName)
        .get();

      if (snapshot.empty) {
        console.log(`No products found for: ${authorName}`);
        return [];
      }

      return snapshot.docs.map(doc => {
        const data = doc.data();
        return {
          id: doc.id,
          title: data.title,
          imageUrl: data.imageUrl0, // Mapping imageUrl0 to a generic imageUrl for the frontend
          likes: data.likes || 0,
          views: data.views || 0,
          price: data.price,
          authorName: data.authorName,
          description: data.description,
          createdAt: data.createdAt,
        };
      });
    } catch (error) {
      console.error("Firestore Query Error:", error);
      throw new Error("Failed to fetch products");
    }
  }
}