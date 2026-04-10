'use client'
import React from 'react';
import { Heart, Share2, Eye } from 'lucide-react';
import Link from 'next/link';

interface ProductCardProps {
  id: string;
  title: string;
  imageUrl: string;
  likes: number;
  views: number;
}

export default function ProductCard({ id, title, imageUrl, likes, views }: ProductCardProps) {
  return (
    <div className="group relative max-w-sm bg-white rounded-2xl overflow-hidden shadow-sm border border-purple-100 hover:shadow-lg transition-all duration-300">
      
      {/* 1. THE INVISIBLE MASTER LINK */}
      {/* This covers the whole card but contains NO other tags */}
      <Link 
        href={`/postDetail/${id}`} 
        className="absolute inset-0 z-10" 
        aria-label={`View ${title}`}
      />

      {/* 2. VISUAL CONTENT */}
      <div className="relative h-48 w-full bg-purple-50">
        <img src={imageUrl} alt={title} className="w-full h-full object-cover" />
      </div>

      <div className="p-4">
        <h3 className="text-lg font-bold text-gray-800 truncate mb-4">{title}</h3>

        <div className="flex items-center justify-between pt-3 border-t border-gray-100">
          <div className="flex items-center space-x-4 text-gray-500">
            <div className="flex items-center space-x-1">
              <Eye size={18} />
              <span className="text-xs">{views}</span>
            </div>
            
            {/* 3. INTERACTIVE BUTTONS (Must have higher z-index) */}
            <button 
              className="relative z-20 flex items-center space-x-1 hover:text-purple-600 transition"
              onClick={(e) => {
                e.preventDefault(); // Stop the master link from triggering
                console.log("Liked!");
              }}
            >
              <Heart size={18} />
              <span className="text-xs">{likes}</span>
            </button>
          </div>

          <button 
            className="relative z-20 p-2 rounded-full hover:bg-purple-50 text-gray-400 hover:text-purple-600 transition"
            onClick={(e) => {
              e.preventDefault();
              console.log("Shared!");
            }}
          >
            <Share2 size={18} />
          </button>
        </div>
      </div>
    </div>
  );
}