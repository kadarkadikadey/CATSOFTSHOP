// model.ts
export interface DigitalAsset {
  id: string;               // Unique identifier for database lookups
  title: string;            // Name of the digital product
  description: string;      // Detailed explanation of the asset
  price?: number;            // Cost (e.g., 19.99)
  shere: number;
  likes: number;
  views: number;
  imageUrl0: string;
  imageUrl1: string;
  imageUrl2: string;
  imageUrl3: string;
  currency?: string;         // e.g., "USD" or "INR"
  category?: 'Software' | 'Graphic' | 'Course' | 'E-book'; // Limits the options
  authorName: string;       // The client who created the post     // Image to show on the home screen
  fileSize?: string;         // e.g., "15MB" (helpful for digital downloads)
  isAvailable: boolean;     // To hide/show posts if they are sold out or removed
  createdAt: string;        // Date the post was made
}