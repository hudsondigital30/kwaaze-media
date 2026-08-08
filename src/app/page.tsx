export default function HomePage() {
  return (
    <main style={{
      minHeight: '100vh',
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      textAlign: 'center',
      padding: '24px',
      background: '#050c1a',
      color: '#f0f4ff',
      fontFamily: 'Segoe UI, system-ui, sans-serif',
    }}>
      <div style={{ fontSize: '4rem', marginBottom: '24px' }}>🇭🇹</div>
      <h1 style={{
        fontSize: 'clamp(2rem, 6vw, 4rem)',
        fontWeight: 900,
        background: 'linear-gradient(90deg, #ff6b00, #e91e8c)',
        WebkitBackgroundClip: 'text',
        WebkitTextFillColor: 'transparent',
        marginBottom: '16px',
      }}>
        KWAAZE MEDIA
      </h1>
      <p style={{ fontSize: '1.1rem', color: '#8a9ab5', marginBottom: '8px' }}>
        Your premier Caribbean media platform
      </p>
      <p style={{ fontSize: '0.85rem', color: '#546e7a', marginBottom: '40px' }}>
        Powered by <strong style={{ color: '#ff9a3c' }}>Ticsolution</strong>
      </p>
      <p style={{ fontSize: '0.75rem', color: '#374151', marginTop: '60px' }}>
        © 2026 Kwaaze Media · hudsondigital30
      </p>
    </main>
  )
}
