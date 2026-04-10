import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import { Search } from 'lucide-react';
import Link from 'next/link';

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "CATSOFTSHOP",
  description: 'The premier digital marketplace',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        <header className="bg-purple-700 text-white shadow-md">
          <div className="container mx-auto px-4 py-4 flex flex-col md:flex-row justify-between items-center gap-4 md:gap-0">

            {/* LOGO - Stays centered on mobile, left on desktop */}
            <h1 className="text-2xl font-bold tracking-tight">CATSOFTSHOP</h1>

            {/* NAV - Spaced out on mobile, tight on desktop */}
            <nav>
              <ul className="flex flex-wrap justify-center items-center gap-4 md:gap-6 font-medium text-sm md:text-base">
                <Link href="/Searchpage" className="p-2 hover:bg-gray-100 rounded-full transition-all">
                  <Search size={22} className="text-white-600" />
                </Link>
                <li><a href="/" className="hover:text-purple-200 transition">Home</a></li>
                <li><a href="#about-us" className="hover:text-purple-200 transition">About Us</a></li>
                
                <li>
                  <a href="#" className="bg-white text-purple-700 px-3 py-1.5 md:px-4 md:py-2 rounded-lg hover:bg-purple-100 transition shadow-sm whitespace-nowrap">
                    Download App
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </header>

        {/* --- DYNAMIC PAGE CONTENT --- */}
        <main className="flex-grow">
          {children}
        </main>

        {/* --- SHARED FOOTER --- */}
        <footer id="about-us" className="bg-gray-900 text-purple-100 py-16">
          <div className="container mx-auto px-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
              <div>
                <h3 className="text-2xl font-semibold mb-6 text-white border-l-4 border-purple-500 pl-4">
                  About Us
                </h3>
                <p className="text-gray-400 leading-relaxed text-lg">
                  Welcome to <span className="text-purple-400 font-bold">CATSOFTSHOP</span>,
                  the premier digital marketplace...
                </p>
              </div>
              <div className="flex flex-col justify-end md:items-end">
                <p className="text-gray-400 italic">"Empowering creators, one post at a time."</p>
              </div>
            </div>
            <div className="mt-12 pt-8 border-t border-gray-800 text-sm text-gray-500 flex justify-between items-center">
              <p>© 2026 CATSOFTSHOP. All rights reserved.</p>
            </div>
          </div>
        </footer>
      </body>
    </html>
  );
}
