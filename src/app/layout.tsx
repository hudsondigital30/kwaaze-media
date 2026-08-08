import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: {
    default: 'Kwaaze Media',
    template: '%s | Kwaaze Media',
  },
  description: 'Your premier Caribbean media platform — news, sports, entertainment and Haitian culture.',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
