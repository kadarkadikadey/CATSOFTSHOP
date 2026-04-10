import { Heart, Eye, ShoppingCart, Share2, ArrowLeft, ShieldCheck } from 'lucide-react';
import Link from 'next/link';
// Remove the myProducts import
import ImageGallery from '@/component/imageGallery/imageGallery';
import ProductCard from '@/component/postCard/page';

export default async function PostPage({ params }: { params: Promise<{ 'post-id': string }> }) {
  const { 'post-id': postId } = await params;

  // 1. FETCH DATA FROM YOUR API
  let post = null;
  try {
    const response = await fetch(`http://localhost:4000/products/ID/${postId}`, {
      cache: 'no-store', // Ensures fresh data from Firestore
    });

    if (response.ok) {
      post = await response.json();
    }
  } catch (error) {
    console.error("Fetch error:", error);
  }

  // 2. ERROR STATE (Product not found)
  if (!post) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center text-center p-6">
        <div className="bg-purple-50 p-6 rounded-full mb-4">
          <ArrowLeft size={48} className="text-purple-600" />
        </div>
        <h2 className="text-3xl font-bold text-gray-900">Asset Not Found</h2>
        <p className="text-gray-500 mt-2">The digital asset you're looking for might have been moved or deleted.</p>
        <Link href="/" className="mt-8 bg-purple-600 text-white px-8 py-3 rounded-xl font-bold hover:bg-purple-700 transition-all">
          Return to Marketplace
        </Link>
      </div>
    );
  }

  // 3. HANDLE IMAGES (Mapping from your API structure)
  const allImages = [
    post.imageUrl0,
    post.imageUrl1,
    post.imageUrl2,
    post.imageUrl3,
    post.imageUrl // Fallback for your createProduct logic
  ].filter(Boolean) as string[];

  // 4. RELATED POSTS (Optional: Fetching others by same author)
  // For now, we can leave this empty or fetch from your SEARCH endpoint
  const relatedPosts = [];

  return (
    <div className="min-h-screen bg-white pb-20">
      <div className="max-w-7xl mx-auto p-6">
        {/* Navigation */}
        <nav className="flex justify-between items-center mb-8">
          <Link href="/" className="flex items-center text-gray-500 font-medium hover:text-purple-600 transition-colors group">
            <ArrowLeft size={20} className="mr-2 group-hover:-translate-x-1 transition-transform" />
            Back to Marketplace
          </Link>
          <button className="flex items-center space-x-2 text-gray-400 hover:text-purple-600 transition-colors">
            <Share2 size={20} />
            <span className="text-sm font-medium">Share Asset</span>
          </button>
        </nav>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-12 lg:gap-20 items-stretch max-w-7xl mx-auto px-6">
          {/* LEFT SIDE: GALLERY */}
          <div className="lg:sticky lg:top-8">
            <ImageGallery images={allImages} />
          </div>

          {/* RIGHT SIDE: CONTENT SECTION */}
          <div className="flex flex-col">
            <div className="mb-6">
              <span className={`inline-flex items-center px-3 py-1 text-xs font-bold rounded-full uppercase tracking-widest ${post.isAvailable !== false ? 'bg-green-100 text-green-700' : 'bg-orange-100 text-orange-700'}`}>
                <span className={`w-2 h-2 rounded-full mr-2 ${post.isAvailable !== false ? 'bg-green-500' : 'bg-orange-500'}`}></span>
                {post.isAvailable !== false ? 'Available Now' : 'Limited Stock'}
              </span>
              <h1 className="text-5xl font-black text-gray-900 mt-6 leading-tight tracking-tight">
                {post.title || post.name} {/* Handle both field names */}
              </h1>
              <div className="flex items-center mt-4">
                <div className="w-8 h-8 rounded-full bg-purple-100 flex items-center justify-center text-purple-600 font-bold text-xs mr-3">
                  {(post.authorName || 'U')[0]}
                </div>
                <p className="text-gray-500">
                  Created by
                  <Link
                    href={`/userDetail/${post.authorName}`}
                    className="text-purple-600 font-bold ml-1 hover:text-purple-800 transition-colors"
                  >
                    {post.authorName || 'Unknown Creator'}
                  </Link>
                </p>
              </div>
            </div>

            {/* STATS BAR */}
            <div className="flex space-x-8 mb-10 py-6 border-y border-gray-100">
              <div className="flex flex-col">
                <span className="text-2xl font-black text-gray-900">{(post.views || 0).toLocaleString()}</span>
                <span className="text-xs text-gray-400 font-bold uppercase tracking-wider">Views</span>
              </div>
              <div className="flex flex-col">
                <span className="text-2xl font-black text-gray-900">{post.likes || 0}</span>
                <span className="text-xs text-gray-400 font-bold uppercase tracking-wider">Likes</span>
              </div>
              <div className="flex flex-col">
                <span className="text-2xl font-black text-gray-900">{post.shere || 0}</span>
                <span className="text-xs text-gray-400 font-bold uppercase tracking-wider">Shares</span>
              </div>
            </div>

            {/* DESCRIPTION */}
            <div className="mb-12">
              <h3 className="text-xl font-bold text-gray-900 mb-4 italic">Product Description</h3>
              <p className="text-gray-600 text-lg leading-relaxed">
                {post.description || "No description available for this asset."}
              </p>
            </div>

            {/* PRICING CARD */}
            <div className="bg-white p-8 rounded-[2rem] border-2 border-purple-100 shadow-xl shadow-purple-50">
              <div className="flex items-center justify-between mb-8">
                <div>
                  <p className="text-xs font-black text-purple-500 uppercase tracking-widest mb-1">Standard License</p>
                  <p className="text-6xl font-black text-gray-900">
                    ${Number(post.price || 0).toFixed(2)}
                  </p>
                </div>
                <div className="text-right">
                  <span className="block text-green-600 font-bold text-sm">✓ Ready to use</span>
                  <span className="block text-gray-400 text-xs font-medium">Verified by CatSoft</span>
                </div>
              </div>

              <button
                disabled={post.isAvailable === false}
                className={`w-full py-5 rounded-2xl font-black text-xl flex items-center justify-center space-x-4 transition-all
                  ${post.isAvailable !== false
                    ? 'bg-purple-600 text-white hover:bg-purple-700 shadow-lg shadow-purple-200 active:scale-95'
                    : 'bg-gray-200 text-gray-500 cursor-not-allowed'}`}
              >
                <ShoppingCart size={24} />
                <span>{post.isAvailable !== false ? 'Add to Collection' : 'Currently Unavailable'}</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}