import ProductCard from '@/component/postCard/page';

// 1. Remove the import for myProducts (fakeData)
// 2. Make the function 'async'
async function showPostInHomeScreen() {
    let products = [];

    try {
        // 3. Fetch data from your NestJS API
        const response = await fetch('http://localhost:4000/products/ALL', {
            cache: 'no-store', // This ensures you get fresh data from Firestore every time
        });

        if (!response.ok) {
            throw new Error('Failed to fetch products');
        }

        products = await response.json();
    } catch (error) {
        console.error("Error loading products:", error);
        return <div className="text-red-500">Error loading products. Check if the server is running.</div>;
    }

    return (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            {products.map((product: any) => (
                <ProductCard
                    key={product.id}
                    id={product.id}
                    title={product.title}
                    // Note: Ensure the API field names match (imageUrl0 vs imageUrl)
                    imageUrl={product.imageUrl0 || product.imageUrl} 
                    likes={product.likes || 0}
                    views={product.views || 0}
                />
            ))}
        </div>
    );
}
  export default showPostInHomeScreen;