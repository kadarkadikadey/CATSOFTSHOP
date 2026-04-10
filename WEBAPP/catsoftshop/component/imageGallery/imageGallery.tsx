"use client"; // 1. This is required for onClick to work!

import { useState } from 'react';

interface ImageGalleryProps {
  images: string[];
}

export default function ImageGallery({ images }: ImageGalleryProps) {
  // 2. Initialize the state with the first image in your array
  const [activeImage, setActiveImage] = useState(images[0]);

  return (
    <div className="flex flex-col gap-6 w-full h-full">
      
      {/* MAIN LARGE IMAGE */}
      <div className="relative w-full h-[500px] lg:h-[650px] rounded-[2.5rem] overflow-hidden bg-gray-100 border-4 border-white shadow-2xl">
        <img
          key={activeImage} // Adding a key helps React handle the transition smoothly
          src={activeImage}
          alt="Selected View"
          className="w-full h-full object-cover transition-opacity duration-300 animate-in fade-in"
        />
      </div>

      {/* THUMBNAIL BUTTONS */}
      <div className="grid grid-cols-4 gap-4 px-2">
        {images.map((url, index) => (
          <button
            key={index}
            // 3. Update the state when clicked
            onClick={() => setActiveImage(url)} 
            className={`relative aspect-square rounded-2xl overflow-hidden border-4 transition-all duration-200 
              ${activeImage === url 
                ? 'border-purple-600 scale-105 shadow-lg' 
                : 'border-transparent opacity-50 hover:opacity-100 hover:scale-105'
              }`}
          >
            <img
              src={url}
              alt={`Thumbnail ${index + 1}`}
              className="w-full h-full object-cover"
            />
          </button>
        ))}
      </div>
    </div>
  );
}