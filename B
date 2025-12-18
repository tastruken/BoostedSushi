import React, { useState, useEffect } from 'react';
import { Menu, X, Instagram, Facebook, ChevronRight, Flame, Star } from 'lucide-react';

const BoostedSushiApp = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [activeCategory, setActiveCategory] = useState('Todos');
  const [isSticky, setIsSticky] = useState(false);

  // Efecto para detectar scroll y hacer sticky la barra de categorías
  useEffect(() => {
    const handleScroll = () => {
      setIsSticky(window.scrollY > 600);
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  // Datos del Menú
  const products = [
    {
      id: 1,
      name: "The Ultimate Sushi Burger",
      price: 12990,
      description: "Nuestra creación maestra. Panes de arroz crujiente con sésamo, rellenos de tartar de salmón picante, palta fresca, repollo morado, mayonesa de wasabi y salsa anguila.",
      image: "2024_09_sushiburgergarnele",
      category: "Estrella",
      isSpicy: true,
      isStar: true
    },
    {
      id: 2,
      name: "Dragon Roll Fire",
      price: 9990,
      description: "Camarón furai, palta, cubierto en palta y tártaro de salmón sopleteado.",
      image: "https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?auto=format&fit=crop&q=80&w=800",
      category: "Rolls",
      isSpicy: true,
      isStar: false
    },
    {
      id: 3,
      name: "Acevichado Nikkei",
      price: 9490,
      description: "Pollo teriyaki, queso crema, envuelto en atún con salsa acevichada.",
      image: "https://images.unsplash.com/photo-1635526910429-04348274d9e0?auto=format&fit=crop&q=80&w=800",
      category: "Rolls",
      isSpicy: false,
      isStar: false
    },
    {
      id: 4,
      name: "Tempura Ebi Cheese",
      price: 8990,
      description: "Frito en panko. Camarón, cebollín, envuelto en queso crema.",
      image: "https://images.unsplash.com/photo-1611143669185-af224c5e3252?auto=format&fit=crop&q=80&w=800",
      category: "Rolls (Calientes)",
      isSpicy: false,
      isStar: false
    },
    {
      id: 5,
      name: "Sashimi Mix (9 cortes)",
      price: 11990,
      description: "Cortes frescos del día: Salmón, Atún y Pulpo.",
      image: "https://images.unsplash.com/photo-1534482421-64566f976cfa?auto=format&fit=crop&q=80&w=800",
      category: "Sashimi",
      isSpicy: false,
      isStar: false
    },
    {
      id: 6,
      name: "Nigiri Trufado",
      price: 5990,
      description: "Salmón sopleteado, aceite de trufa blanca y sal de mar.",
      image: "https://images.unsplash.com/photo-1617196019286-dc35f5dc11d5?auto=format&fit=crop&q=80&w=800",
      category: "Nigiri",
      isSpicy: false,
      isStar: false
    },
    {
      id: 7,
      name: "Gohan Power Bowl",
      price: 10490,
      description: "Arroz, salmón, camarón, palta, edamame y ponzu.",
      image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&q=80&w=800",
      category: "Bowls",
      isSpicy: false,
      isStar: false
    },
    {
      id: 8,
      name: "Gyozas (5 un.)",
      price: 4990,
      description: "Cerdo y verduras, al vapor y selladas.",
      image: "https://images.unsplash.com/photo-1626509653295-813e3db83422?auto=format&fit=crop&q=80&w=800",
      category: "Entradas",
      isSpicy: false,
      isStar: false
    },
    {
      id: 9,
      name: "Handroll XL",
      price: 3990,
      description: "Cono clásico de salmón, palta y cebollín.",
      image: "https://images.unsplash.com/photo-1615361200141-f45040f367be?auto=format&fit=crop&q=80&w=800",
      category: "Handroll",
      isSpicy: false,
      isStar: false
    },
    {
      id: 10,
      name: "Tori Panko",
      price: 8490,
      description: "Pollo, queso crema, cebollín. Envuelto en pollo panko.",
      image: "https://images.unsplash.com/photo-1607301406259-dfb186e15de8?auto=format&fit=crop&q=80&w=800",
      category: "Rolls (Calientes)",
      isSpicy: false,
      isStar: false
    }
  ];

  const categories = ['Todos', 'Estrella', 'Rolls', 'Rolls (Calientes)', 'Sashimi', 'Bowls', 'Entradas'];

  const filteredProducts = activeCategory === 'Todos' 
    ? products 
    : products.filter(p => p.category.includes(activeCategory) || (activeCategory === 'Estrella' && p.isStar));

  const formatPrice = (price) => {
    return new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' }).format(price);
  };

  // Obtener el producto estrella
  const starProduct = products.find(p => p.isStar);

  return (
    <div className="font-sans bg-[#111111] text-gray-100 min-h-screen selection:bg-orange-500 selection:text-white">
      
      {/* Navbar Minimalista */}
      <nav className="fixed top-0 w-full z-50 bg-[#111111]/95 backdrop-blur-md border-b border-white/10">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            {/* Logo */}
            <div className="flex items-center gap-2 cursor-pointer">
              <span className="text-xl font-black tracking-tighter text-white">
                BOOSTED<span className="text-orange-500">.</span>SUSHI
              </span>
            </div>

            {/* Desktop Menu */}
            <div className="hidden md:flex space-x-8 items-center text-sm font-medium">
              <a href="#menu" className="text-gray-300 hover:text-white transition-colors">Carta</a>
              <a href="#nosotros" className="text-gray-300 hover:text-white transition-colors">Nosotros</a>
              <a href="#delivery" className="text-gray-300 hover:text-white transition-colors">Delivery</a>
            </div>

            {/* Mobile Actions & Menu Button */}
            <div className="md:hidden flex items-center gap-4">
              <button onClick={() => setIsMenuOpen(!isMenuOpen)} className="text-white hover:text-orange-500 transition-colors">
                {isMenuOpen ? <X size={24} /> : <Menu size={24} />}
              </button>
            </div>
          </div>
        </div>

        {/* Mobile Dropdown Menu */}
        {isMenuOpen && (
          <div className="md:hidden bg-[#1a1a1a] border-t border-white/10 absolute w-full left-0 animate-in slide-in-from-top-5">
            <div className="flex flex-col p-4 space-y-4 text-center">
              <a href="#menu" className="text-gray-300 hover:text-white font-medium py-2" onClick={() => setIsMenuOpen(false)}>Carta</a>
              <a href="#nosotros" className="text-gray-300 hover:text-white font-medium py-2" onClick={() => setIsMenuOpen(false)}>Nosotros</a>
              <a href="#delivery" className="text-gray-300 hover:text-white font-medium py-2" onClick={() => setIsMenuOpen(false)}>Delivery</a>
            </div>
          </div>
        )}
      </nav>

      {/* Hero Section (Producto Estrella) */}
      <section className="pt-24 pb-8 lg:pt-32 lg:pb-16 px-4">
        <div className="max-w-6xl mx-auto bg-[#1a1a1a] rounded-3xl overflow-hidden shadow-2xl border border-white/5">
          <div className="grid md:grid-cols-2">
            <div className="h-64 md:h-96 relative overflow-hidden group">
              <img 
                src={starProduct.image}
                alt={starProduct.name}
                className="w-full h-full object-cover transform group-hover:scale-105 transition-transform duration-700"
              />
            </div>
            <div className="p-8 md:p-12 flex flex-col justify-center items-start space-y-6">
              <div>
                <h2 className="text-4xl md:text-5xl font-black text-white mb-2 leading-none">{starProduct.name.toUpperCase()}</h2>
                <p className="text-gray-400 text-lg">{starProduct.description}</p>
              </div>
              <div className="w-full h-px bg-white/10"></div>
              <div className="flex items-center justify-between w-full">
                <span className="text-3xl font-bold text-orange-500">{formatPrice(starProduct.price)}</span>
                <a 
                  href="#menu"
                  className="bg-white text-black hover:bg-gray-200 px-6 py-3 rounded-full font-bold transition-all flex items-center gap-2"
                >
                  Ver Menú Completo <ChevronRight size={18} />
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Menú Sticky Header */}
      <div className={`sticky top-16 z-40 bg-[#111111]/95 backdrop-blur-md border-y border-white/5 py-4 transition-all ${isSticky ? 'shadow-xl' : ''}`}>
        <div className="max-w-7xl mx-auto px-4 overflow-x-auto no-scrollbar">
          <div className="flex space-x-2 md:justify-center min-w-max">
            {categories.map((cat) => (
              <button
                key={cat}
                onClick={() => setActiveCategory(cat)}
                className={`px-4 py-2 rounded-full text-sm font-semibold transition-all whitespace-nowrap ${
                  activeCategory === cat
                    ? 'bg-orange-500 text-white'
                    : 'bg-[#222] text-gray-400 hover:bg-[#333] hover:text-white'
                }`}
              >
                {cat}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Menu Grid */}
      <section id="menu" className="py-12 max-w-7xl mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredProducts.map((product) => (
            <div key={product.id} className="bg-[#1a1a1a] rounded-xl overflow-hidden group hover:ring-1 hover:ring-orange-500/50 transition-all flex flex-col md:flex-row h-auto md:h-40">
              <div className="h-48 md:h-full md:w-40 w-full relative shrink-0 overflow-hidden">
                <img 
                  src={product.image} 
                  alt={product.name}
                  className="w-full h-full object-cover transform group-hover:scale-110 transition-transform duration-500"
                />
                 {product.isSpicy && (
                    <div className="absolute top-2 left-2 bg-red-600 text-white text-[10px] font-bold px-2 py-0.5 rounded-full flex items-center gap-1 shadow-sm">
                      <Flame size={10} /> SPICY
                    </div>
                  )}
              </div>
              <div className="p-4 flex flex-col justify-between flex-grow">
                <div>
                  <div className="flex justify-between items-start">
                    <h3 className="text-lg font-bold text-white leading-tight">{product.name}</h3>
                  </div>
                  <p className="text-gray-400 text-xs mt-1 leading-relaxed line-clamp-2 md:line-clamp-3">
                    {product.description}
                  </p>
                </div>
                <div className="flex justify-end items-center mt-3">
                  <span className="text-lg font-semibold text-orange-400">{formatPrice(product.price)}</span>
                </div>
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* SECCIÓN: Sobre Nosotros / Filosofía */}
      <section id="nosotros" className="py-16 bg-[#161616] border-y border-white/5">
        <div className="max-w-7xl mx-auto px-4 grid md:grid-cols-2 gap-12 items-center">
          <div className="order-2 md:order-1 space-y-6">
            <h2 className="text-3xl md:text-4xl font-black text-white uppercase">No es solo Sushi.<br/>Es <span className="text-orange-500">Boosted.</span></h2>
            <p className="text-gray-400 leading-relaxed">
              Nacimos con una misión: eliminar el sushi aburrido y pequeño. En Boosted, cada roll es un nivel nuevo. Usamos ingredientes frescos, cortes generosos y salsas que despiertan tus sentidos.
            </p>
            <p className="text-gray-400 leading-relaxed">
              Ya sea que necesites energía para una sesión de gaming, un bajón nocturno o simplemente comida de verdad, aquí tienes tu power-up.
            </p>
          </div>
          <div className="order-1 md:order-2 relative h-64 md:h-80 rounded-2xl overflow-hidden shadow-2xl">
             <div className="absolute inset-0 bg-gradient-to-t from-black/80 to-transparent z-10"></div>
             <img 
               src="https://images.unsplash.com/photo-1553621042-f6e147245754?q=80&w=1000&auto=format&fit=crop" 
               alt="Chef preparando sushi" 
               className="w-full h-full object-cover"
             />
             <div className="absolute bottom-6 left-6 z-20">
               <span className="text-white font-bold text-xl">Calidad Premium</span>
               <div className="flex gap-1 mt-1">
                 {[1,2,3,4,5].map(i => <Star key={i} size={16} className="fill-orange-500 text-orange-500" />)}
               </div>
             </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer id="delivery" className="bg-[#0a0a0a] border-t border-white/5 py-8 mt-12">
        <div className="max-w-7xl mx-auto px-4 text-center">
          <div className="mb-6">
            <h4 className="text-white font-bold text-lg mb-2">Delivery & Takeout</h4>
            <p className="text-gray-400 text-sm">Envíos a todo Santiago. Gratis por compras sobre $20.000.</p>
          </div>
          <p className="text-gray-500 text-sm">© 2024 Boosted Sushi. Santiago, Chile.</p>
          <div className="flex justify-center gap-4 mt-4">
             <div className="w-8 h-8 rounded-full bg-[#222] flex items-center justify-center text-gray-400 hover:text-white cursor-pointer"><Instagram size={16}/></div>
             <div className="w-8 h-8 rounded-full bg-[#222] flex items-center justify-center text-gray-400 hover:text-white cursor-pointer"><Facebook size={16}/></div>
          </div>
        </div>
      </footer>
    </div>
  );
};

export default BoostedSushiApp;
