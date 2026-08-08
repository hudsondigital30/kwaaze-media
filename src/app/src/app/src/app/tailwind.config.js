/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        navy:  '#050c1a',
        navy2: '#080f1f',
        card:  '#0d1628',
        card2: '#111b2e',
        org:   '#ff6b00',
        org2:  '#ff9a3c',
        kpink: '#e91e8c',
      },
    },
  },
  plugins: [],
}
