import Link from 'next/link';
import { Download, Star, Rocket, ShieldCheck, ArrowRight } from 'lucide-react';
import Homepage from './Homepage/page';
import { ShoppingBag } from 'lucide-react';

export default function Home() {
  return (
    <div className="min-h-screen bg-white text-gray-900">

      {/* 1. HERO SECTION: The Big Hook */}
      <section className="relative py-20 px-8 bg-gradient-to-b from-purple-50 to-white text-center">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-5xl md:text-7xl font-extrabold tracking-tight mb-6">
            The Digital Marketplace for <span className="text-purple-600">Modern Creators.</span>
          </h1>
          <p className="text-xl text-gray-600 mb-10 leading-relaxed">
            Buy high-quality digital assets or start selling your own boilerplates,
            templates, and scripts to a global audience in minutes.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/" className="bg-purple-600 text-white px-8 py-4 rounded-full font-bold text-lg hover:bg-purple-700 transition flex items-center justify-center gap-2">
              <Download size={20} /> Download App
            </Link>
          </div>
        </div>
      </section>

      {/* show product  */}
      <section className="py-24 px-8 bg-white border-y border-gray-100">
        <div className="max-w-5xl mx-auto flex flex-col md:flex-row items-center justify-between gap-12">

          {/* Left Side: Content */}
          <div className="flex-1 text-center md:text-left">
            <h2 className="text-4xl font-extrabold text-gray-900 mb-4">
              Explore Our Digital <span className="text-purple-600">Marketplace</span>
            </h2>
            <p className="text-lg text-gray-600 mb-8 max-w-xl">
              From high-performance Node.js boilerplates to stunning UI kits,
              discover premium assets created by top-tier developers.
              Everything you need to ship your next project faster.
            </p>

            {/* THE REDIRECT BUTTON */}
            <Link
              href="/Homepage"
              className="inline-flex items-center gap-3 bg-purple-600 text-white px-10 py-4 rounded-2xl font-bold text-xl hover:bg-purple-700 hover:shadow-xl hover:shadow-purple-200 transition-all group"
            >
              <ShoppingBag size={22} />
              Browse All Products
              <ArrowRight size={22} className="group-hover:translate-x-2 transition-transform" />
            </Link>
          </div>

          {/* Right Side: Visual Teaser */}
          <div className="flex-1 w-full max-w-md">
            <div className="relative p-8 bg-purple-50 rounded-3xl border-2 border-purple-100 overflow-hidden">
              {/* Decorative background circles */}
              <div className="absolute -top-10 -right-10 w-40 h-40 bg-purple-200 rounded-full blur-3xl opacity-50"></div>

              <div className="relative space-y-4">
                <div className="bg-white p-4 rounded-xl shadow-sm border border-purple-100 flex items-center gap-4">
                  <div className="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center text-green-600 font-bold">JS</div>
                  <div>
                    <p className="font-bold text-gray-800">Auth Boilerplate</p>
                    <p className="text-sm text-gray-500">Verified by CatSoft</p>
                  </div>
                </div>
                <div className="bg-white p-4 rounded-xl shadow-sm border border-purple-100 flex items-center gap-4 translate-x-4">
                  <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-blue-600 font-bold">TS</div>
                  <div>
                    <p className="font-bold text-gray-800">SaaS Starter Kit</p>
                    <p className="text-sm text-gray-500">500+ Downloads</p>
                  </div>
                </div>
                <div className="bg-white p-4 rounded-xl shadow-sm border border-purple-100 flex items-center gap-4 -translate-x-2">
                  <div className="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center text-orange-600 font-bold">UI</div>
                  <div>
                    <p className="font-bold text-gray-800">Dashboard Theme</p>
                    <p className="text-sm text-gray-500">New Release</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </section>

      {/* 2. CREATOR INSPIRATION: Why Sell Here? */}
      <section className="py-20 px-8 bg-gray-50">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl font-bold mb-4">Turn Your Code into Cash</h2>
            <p className="text-gray-500">Join 5,000+ developers making passive income on CatSoftShop.</p>
          </div>

          <div className="grid md:grid-cols-3 gap-8">
            <div className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100">
              <Rocket className="text-purple-600 mb-4" size={32} />
              <h3 className="text-xl font-bold mb-2">Fast Upload</h3>
              <p className="text-gray-600">Upload your zip files or GitHub repos and set your price in under 2 minutes.</p>
            </div>
            <div className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100">
              <ShieldCheck className="text-purple-600 mb-4" size={32} />
              <h3 className="text-xl font-bold mb-2">Secure Payouts</h3>
              <p className="text-gray-600">Verified creators get paid instantly through our secure gateway with 0% hidden fees.</p>
            </div>
            <div className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100">
              <Star className="text-purple-600 mb-4" size={32} />
              <h3 className="text-xl font-bold mb-2">Build Authority</h3>
              <p className="text-gray-600">Get a verified "Dev" badge and build your portfolio profile to attract custom work.</p>
            </div>
          </div>
        </div>
      </section>

  
      {/* 4. CALL TO ACTION (CTA) */}
      <section className="py-20 px-8 bg-purple-700 text-white text-center">
        <h2 className="text-4xl font-bold mb-6">Ready to join the marketplace?</h2>
        <p className="text-purple-100 mb-10 text-lg">Download the app to browse 10,000+ digital assets or start your store.</p>
        <Link href="/" className="bg-white text-purple-700 px-10 py-4 rounded-full font-bold text-xl hover:bg-gray-100 transition inline-flex items-center gap-2">
          Get Started Now <ArrowRight size={20} />
        </Link>
      </section>
    </div>
  );
}