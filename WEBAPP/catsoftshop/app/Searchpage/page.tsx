"use client";

import { useState } from 'react';
import { Search, ArrowRight, ShoppingBag, SearchX } from 'lucide-react';
import ProductCard from "@/component/postCard/page";

export default function SearchPage() {
  const [query, setQuery] = useState("");
  const [results, setResults] = useState<any[]>([]);
  const [hasSearched, setHasSearched] = useState(false);
  const [loading, setLoading] = useState(false);

  const handleSearch = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!query.trim()) return;

    setLoading(true);
    setHasSearched(true);

    try {
      // Calling your NestJS SEARCH API by name
      const res = await fetch(`http://localhost:4000/products/SEARCH?name=${encodeURIComponent(query)}`);
      if (res.ok) {
        const data = await res.json();
        setResults(Array.isArray(data) ? data : [data]);
      } else {
        setResults([]);
      }
    } catch (error) {
      console.error("Search failed:", error);
      setResults([]);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-white p-8">
      <div className="max-w-4xl mx-auto">
        
        {/* SEARCH BAR */}
        <form onSubmit={handleSearch} className="relative mb-12">
          <input 
            type="text"
            placeholder="Search products by name..."
            className="w-full pl-6 pr-16 py-5 bg-gray-50 border-2 border-gray-100 rounded-2xl focus:border-purple-500 focus:outline-none text-xl transition-all"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            autoFocus
          />
          <button 
            type="submit"
            className="absolute right-3 top-1/2 -translate-y-1/2 bg-purple-600 text-white p-3 rounded-xl hover:bg-purple-700 transition-all"
          >
            <ArrowRight size={24} />
          </button>
        </form>

        {/* --- STATE 1: NOT SEARCHED YET --- */}
        {!hasSearched && (
          <div className="text-center py-20">
            <div className="bg-purple-50 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6">
              <ShoppingBag className="text-purple-600" size={32} />
            </div>
            <h2 className="text-2xl font-bold text-gray-900">Discover something new</h2>
            <p className="text-gray-500 mt-2">Type a product name above to start exploring the marketplace.</p>
          </div>
        )}

        {/* --- STATE 2: LOADING --- */}
        {loading && <p className="text-center text-purple-600 font-medium">Searching for "{query}"...</p>}

        {/* --- STATE 3: RESULTS FOUND --- */}
        {hasSearched && !loading && results.length > 0 && (
          <div>
            <h3 className="text-gray-500 mb-6 font-medium">Found {results.length} results for "{query}"</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              {results.map((product) => (
                <ProductCard 
                  key={product.id}
                  id={product.id}
                  title={product.title || product.name}
                  imageUrl={product.imageUrl0 || product.imageUrl}
                  likes={product.likes}
                  views={product.views}
                />
              ))}
            </div>
          </div>
        )}

        {/* --- STATE 4: NO RESULTS FOUND --- */}
        {hasSearched && !loading && results.length === 0 && (
          <div className="text-center py-20">
            <SearchX className="text-gray-300 mx-auto mb-4" size={64} />
            <h2 className="text-xl font-semibold text-gray-800">No products found</h2>
            <p className="text-gray-500 mt-2">Try a different keyword or check your spelling.</p>
          </div>
        )}

      </div>
    </div>
  );
}