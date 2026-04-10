import { Module, Global } from '@nestjs/common';
import * as admin from 'firebase-admin';
import * as path from 'path';
import * as fs from 'fs'; // Import filesystem module

@Global()
@Module({
  providers: [
    {
      provide: 'FIREBASE_APP',
      useFactory: () => {
        const configPath = path.join(
          process.cwd(), 
          'config', 
          'catsoftshop-firebase-adminsdk-fbsvc-2223ffe7ee.json'
        );

        // Debugging check:
        if (!fs.existsSync(configPath)) {
          throw new Error(`Firebase config file not found at: ${configPath}`);
        }

        const serviceAccount = JSON.parse(fs.readFileSync(configPath, 'utf8'));

        return admin.initializeApp({
          credential: admin.credential.cert(serviceAccount),
        });
      },
    },
  ],
  exports: ['FIREBASE_APP'],
})
export class FirebaseModule {}