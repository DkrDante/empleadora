import React from 'react';

const Empleadora = () => {
  return (
    <div className="bg-black min-h-screen text-white overflow-hidden relative">
      <div className="absolute inset-0 flex items-center justify-center opacity-5 overflow-hidden">
        <div className="text-[40rem] font-bold whitespace-nowrap animate-marquee">
          empleadora empleadora empleadora
        </div>
      </div>
      <nav className="flex justify-between items-center p-4 relative z-10">
        <div className="text-2xl font-bold">Empleadora</div>
        <div className="space-x-4">
          <a href="#" className="hover:text-gray-300">About</a>
          <a href="#" className="hover:text-gray-300">Products</a>
          <a href="#" className="hover:text-gray-300">Blog</a>
          <a href="#" className="hover:text-gray-300">Contests</a>
          <a href="#" className="hover:text-gray-300">Contact us</a>
        </div>
      </nav>
      <main className="flex items-center justify-center min-h-[calc(100vh-64px)] relative z-10">
        <h1 className="text-6xl font-normal text-center">
          Aura
          <br />
          old money
        </h1>
      </main>
    </div>
  );
};

export default Empleadora;
