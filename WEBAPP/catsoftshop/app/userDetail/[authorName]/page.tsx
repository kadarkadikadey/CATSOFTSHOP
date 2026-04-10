import ProductCard from "@/component/postCard/page";
import Link from "next/link";
import { notFound } from "next/navigation";

interface PageProps {
    params: Promise<{ authorName: string }>;
}

export default async function UserDetail({ params }: PageProps) {
    const { authorName } = await params;
    const decodedName = decodeURIComponent(authorName);

    // 1. URLs
    const userUrl = `http://localhost:4000/users/SEARCH?name=${decodedName}`;
    // Update this line in your page.tsx
    const productsUrl = `http://localhost:4000/products/SEARCH_BY_AUTHOR?authorName=${decodedName}`;

    try {
        // 2. FETCH DATA IN PARALLEL
        const [userRes, productsRes] = await Promise.all([
            fetch(userUrl, { cache: 'no-store' }),
            fetch(productsUrl, { cache: 'no-store' })
        ]);

        if (!userRes.ok) return notFound();

        const userJson = await userRes.json();
        const authorProducts = productsRes.ok ? await productsRes.json() : [];

        // 3. EXTRACT USER FROM ARRAY (Fixes the empty UI)
        // Since your API returns [ {...} ], we take the first index
        const userData = Array.isArray(userJson) ? userJson[0] : userJson;

        // If user doesn't exist in the database, show 404
        if (!userData) return notFound();

        // 4. FIX FIREBASE TIMESTAMP (Fixes NaN)
        // Convert _seconds to milliseconds for Javascript Date
        const dateObject = userData.createdAt?._seconds
            ? new Date(userData.createdAt._seconds * 1000)
            : new Date();

        const joinDate = dateObject.toLocaleDateString('en-US', {
            month: 'long',
            year: 'numeric'
        });

        return (
            <div className="max-w-6xl mx-auto p-8">
                {/* --- Header Section --- */}
                <header className="mb-12 border-b pb-8">
                    <div className="flex items-start gap-6">
                        <div className="w-24 h-24 bg-purple-100 rounded-full flex items-center justify-center text-3xl font-bold text-purple-600 shrink-0">
                            {userData.name ? userData.name[0].toUpperCase() : "?"}
                        </div>
                        <div className="flex-1">
                            <div className="flex items-center gap-2">
                                <h1 className="text-4xl font-bold text-gray-900">{userData.name}</h1>
                                {userData.isVerified && (
                                    <span className="bg-blue-600 text-white text-[10px] font-bold px-2 py-0.5 rounded-full">
                                        ✓ VERIFIED
                                    </span>
                                )}
                            </div>
                            <p className="text-gray-600 mt-2 text-lg italic">
                                "{userData.bio || "No bio available."}"
                            </p>
                            <p className="text-gray-400 mt-4 text-sm">
                                Creator since {joinDate} • {authorProducts.length} Assets
                            </p>
                        </div>
                    </div>
                </header>

                {/* --- Products Section --- */}
                <section>
                    <h2 className="text-2xl font-semibold mb-6 text-gray-800">
                        Digital Assets by {userData.name}
                    </h2>

                    {authorProducts.length > 0 ? (
                        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                            {authorProducts.map((product: any) => (
                                <ProductCard
                                    key={product.id}
                                    id={product.id}
                                    title={product.title || product.name}
                                    imageUrl={product.imageUrl0 || product.imageUrl}
                                    likes={product.likes || 0}
                                    views={product.views || 0}
                                />
                            ))}
                        </div>
                    ) : (
                        <div className="text-center py-20 bg-gray-50 rounded-xl border-2 border-dashed border-gray-200">
                            <p className="text-gray-500 italic">This creator hasn't posted any assets yet.</p>
                        </div>
                    )}
                </section>

                <div className="mt-12">
                    <Link href="/" className="text-purple-600 hover:underline">
                        ← Back to Marketplace
                    </Link>
                </div>
            </div>
        );
    } catch (error) {
        console.error("Error loading user details:", error);
        return notFound();
    }
}