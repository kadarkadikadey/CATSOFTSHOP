class UserModel {
  final String name;
  final String email;
  final String profileImage;
  final String bio;
  final int totalPurchases;
  final String joinedDate;

  UserModel({
    required this.name,
    required this.email,
    required this.profileImage,
    required this.bio,
    required this.totalPurchases,
    required this.joinedDate,
  });
}

// Current logged in user data
UserModel currentUser = UserModel(
  name: "Alex Designer",
  email: "alex.design@example.com",
  profileImage: "https://api.dicebear.com/7.x/avataaars/png?seed=Alex",
  bio:
      "UI/UX Enthusiast and Digital Asset Collector. Love minimal designs and dark mode themes.",
  totalPurchases: 14,
  joinedDate: "January 2024",
);

List<ProductModel> purchasedProducts = [
  myProducts[0], // Modern Purple UI Kit
  myProducts[2], // SaaS Landing Page
  myProducts[5], // 3D Abstract Shapes
];

class ProductModel {
  final String id;
  final String title;
  final String imageUrl0;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final int likes;
  final int views;
  final String authorName;
  final String description;
  final double price;
  final int shere;
  final bool isAvailable;
  final String createdAt;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl0,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.likes,
    required this.views,
    required this.authorName,
    required this.description,
    required this.price,
    required this.shere,
    required this.isAvailable,
    required this.createdAt,
  });
}

List<ProductModel> myProducts = [
  ProductModel(
    id: '1',
    title: 'Modern Purple UI Kit',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 120,
    views: 1500,
    authorName: 'CatSoft',
    description: 'A premium UI kit for Next.js designers.',
    price: 29.0,
    shere: 12,
    isAvailable: true,
    createdAt: '2024-01-15',
  ),
  ProductModel(
    id: '2',
    title: 'E-commerce React Icons',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 45,
    views: 400,
    authorName: 'IconicLabs',
    description: '200+ vector icons optimized for web apps.',
    price: 12.0,
    shere: 5,
    isAvailable: true,
    createdAt: '2024-02-10',
  ),
  ProductModel(
    id: '3',
    title: 'SaaS Landing Page Template',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 310,
    views: 5200,
    authorName: 'PixelPerfect',
    description: 'High-converting landing page built with Tailwind.',
    price: 49.0,
    shere: 89,
    isAvailable: true,
    createdAt: '2024-02-28',
  ),
  ProductModel(
    id: '4',
    title: 'Node.js Auth Boilerplate',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 88,
    views: 1100,
    authorName: 'DevLogic',
    description: 'Ready-to-use JWT and OAuth2 setup.',
    price: 19.0,
    shere: 14,
    isAvailable: true,
    createdAt: '2024-03-05',
  ),
  ProductModel(
    id: '5',
    title: 'Cyberpunk Wallpaper Pack',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 215,
    views: 3400,
    authorName: 'NeonArtist',
    description: '4K futuristic backgrounds for your desktop.',
    price: 0.0,
    shere: 156,
    isAvailable: true,
    createdAt: '2024-03-12',
  ),
  ProductModel(
    id: '6',
    title: '3D Abstract Shapes Vol. 1',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 67,
    views: 890,
    authorName: 'StudioRender',
    description: 'High-quality PNGs for social media posts.',
    price: 25.0,
    shere: 8,
    isAvailable: true,
    createdAt: '2024-03-15',
  ),
  ProductModel(
    id: '7',
    title: 'Financial Dashboard Kit',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 142,
    views: 2100,
    authorName: 'DataViz',
    description: 'Complex charts and tables for fintech apps.',
    price: 39.0,
    shere: 22,
    isAvailable: false,
    createdAt: '2024-03-18',
  ),
  ProductModel(
    id: '8',
    title: 'Minimalist Blog Theme',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 53,
    views: 760,
    authorName: 'GhostWriter',
    description: 'A clean, typography-focused CMS theme.',
    price: 15.0,
    shere: 3,
    isAvailable: true,
    createdAt: '2024-03-20',
  ),
  ProductModel(
    id: '9',
    title: 'Python Data Scraper',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 104,
    views: 1800,
    authorName: 'DevLogic',
    description: 'Efficient BeautifulSoup and Selenium scripts.',
    price: 20.0,
    shere: 41,
    isAvailable: true,
    createdAt: '2024-03-22',
  ),
  ProductModel(
    id: '10',
    title: 'Mobile App Wireframes',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 290,
    views: 4800,
    authorName: 'UXFlow',
    description: 'Over 100 mobile screens for rapid prototyping.',
    price: 35.0,
    shere: 92,
    isAvailable: true,
    createdAt: '2024-03-25',
  ),
  ProductModel(
    id: '11',
    title: 'React Admin Dashboard',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 150,
    views: 2200,
    authorName: 'CatSoft',
    description: 'Full-featured admin panel with dark mode.',
    price: 45.0,
    shere: 30,
    isAvailable: true,
    createdAt: '2024-04-01',
  ),
  ProductModel(
    id: '12',
    title: 'Social Media Icon Pack',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 95,
    views: 1300,
    authorName: 'IconicLabs',
    description: 'Glassmorphism style icons for modern apps.',
    price: 10.0,
    shere: 15,
    isAvailable: true,
    createdAt: '2024-04-05',
  ),
  ProductModel(
    id: '13',
    title: 'Portfolio Tailwind Template',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 210,
    views: 3100,
    authorName: 'PixelPerfect',
    description: 'Showcase your work with this elegant design.',
    price: 25.0,
    shere: 45,
    isAvailable: true,
    createdAt: '2024-04-10',
  ),
  ProductModel(
    id: '14',
    title: 'API Rate Limiter Middleware',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 60,
    views: 850,
    authorName: 'DevLogic',
    description: 'Secure your Express.js backend easily.',
    price: 15.0,
    shere: 8,
    isAvailable: true,
    createdAt: '2024-04-12',
  ),
  ProductModel(
    id: '15',
    title: 'Retro Synthwave LUTs',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 130,
    views: 1900,
    authorName: 'NeonArtist',
    description: 'Color grading presets for video editors.',
    price: 18.0,
    shere: 20,
    isAvailable: true,
    createdAt: '2024-04-15',
  ),
  ProductModel(
    id: '16',
    title: '3D Character Base Mesh',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 180,
    views: 2500,
    authorName: 'StudioRender',
    description: 'Low-poly humanoid model for game dev.',
    price: 55.0,
    shere: 12,
    isAvailable: true,
    createdAt: '2024-04-18',
  ),
  ProductModel(
    id: '17',
    title: 'Crypto Tracker Component',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 75,
    views: 1100,
    authorName: 'DataViz',
    description: 'Live price updates with CoinGecko API.',
    price: 22.0,
    shere: 10,
    isAvailable: true,
    createdAt: '2024-04-20',
  ),
  ProductModel(
    id: '18',
    title: 'TypeScript Design Patterns',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 320,
    views: 6000,
    authorName: 'CatSoft',
    description: 'A comprehensive guide and code examples.',
    price: 35.0,
    shere: 120,
    isAvailable: true,
    createdAt: '2024-04-22',
  ),
  ProductModel(
    id: '19',
    title: 'SEO Checklist for Devs',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 110,
    views: 2400,
    authorName: 'GhostWriter',
    description: 'Boost your site ranking with these tips.',
    price: 5.0,
    shere: 65,
    isAvailable: true,
    createdAt: '2024-04-25',
  ),
  ProductModel(
    id: '20',
    title: 'UI Component Library',
    imageUrl0:
        'https://tse4.mm.bing.net/th/id/OIP.jYOEvhnd2mgkDhXfHCx6SAHaIP?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl1:
        'https://tse4.mm.bing.net/th/id/OIP.NCnna1kZaxBkus-OJPIMcAHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl2:
        'https://tse2.mm.bing.net/th/id/OIP.fJ0mZyV4IFS47HQVkY3wqQHaEK?rs=1&pid=ImgDetMain&o=7&rm=3',
    imageUrl3: 'https://images3.alphacoders.com/103/thumb-1920-1031378.png',
    likes: 400,
    views: 8200,
    authorName: 'UXFlow',
    description: 'Fully accessible React components.',
    price: 59.0,
    shere: 210,
    isAvailable: true,
    createdAt: '2024-04-28',
  ),
];
