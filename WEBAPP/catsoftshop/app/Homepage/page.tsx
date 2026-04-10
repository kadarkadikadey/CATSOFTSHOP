
import React from 'react';
import ShowPostInHomeScreen from '@/app/shopPostInHomeScreen/page';

export default function Homepage() {
  return (
    <div className="flex flex-col min-h-screen bg-gray-50">

      {/* MAIN CONTENT - Added Container and Padding */}
      <main className="container mx-auto px-6 py-12 flex-grow">
        <div className="mb-10">
          <h2 className="text-3xl font-bold text-gray-800">Explore Assets</h2>
          <p className="text-gray-500">Discover the best digital tools for your next project.</p>
        </div>

        {/* Your cards will now be centered and spaced out */}
        <ShowPostInHomeScreen />
      </main>

    </div>
  );
}