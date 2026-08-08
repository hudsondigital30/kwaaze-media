#!/bin/bash
# ============================================================
# KWAAZE MEDIA — Full Project Setup Script
# Repo: hudsondigital30/kwaaze-media
# Powered by Ticsolution
# Run: bash setup.sh
# ============================================================

set -e

REPO="hudsondigital30/kwaaze-media"
GITHUB_USER="hudsondigital30"
PROJECT="kwaaze-media"

echo ""
echo "🇭🇹 =================================================="
echo "   KWAAZE MEDIA — Project Setup"
echo "   Powered by Ticsolution"
echo "   Repo: github.com/$REPO"
echo "🇭🇹 =================================================="
echo ""

# ── 0. CHECK DEPENDENCIES ────────────────────────────────
echo "🔍 Checking dependencies..."
command -v node >/dev/null 2>&1 || { echo "❌ Node.js not found. Install from https://nodejs.org"; exit 1; }
command -v npm  >/dev/null 2>&1 || { echo "❌ npm not found."; exit 1; }
command -v git  >/dev/null 2>&1 || { echo "❌ Git not found. Install from https://git-scm.com"; exit 1; }
echo "✅ Node $(node -v) | npm $(npm -v) | Git $(git --version | cut -d' ' -f3)"

# ── 1. CLONE OR INIT REPO ────────────────────────────────
echo ""
echo "📦 Setting up repository..."
if [ -d "$PROJECT" ]; then
  echo "📁 Directory '$PROJECT' already exists — using it."
  cd "$PROJECT"
else
  echo "🔗 Cloning from github.com/$REPO ..."
  git clone "https://github.com/$REPO.git" "$PROJECT" 2>/dev/null || {
    echo "⚠️  Repo empty or not yet created — initializing fresh..."
    mkdir -p "$PROJECT"
    cd "$PROJECT"
    git init
    git remote add origin "https://github.com/$REPO.git"
  }
  cd "$PROJECT" 2>/dev/null || true
fi

# ── 2. CREATE DIRECTORY STRUCTURE ────────────────────────
echo ""
echo "📁 Creating project structure..."

mkdir -p \
  src/app/\(public\)/article/\[slug\] \
  src/app/\(public\)/category/\[slug\] \
  src/app/\(public\)/author/\[slug\] \
  src/app/\(public\)/tag/\[slug\] \
  src/app/\(public\)/search \
  src/app/\(public\)/latest \
  src/app/\(public\)/news \
  src/app/\(public\)/sports \
  src/app/\(public\)/entertainment \
  src/app/\(public\)/haiti \
  src/app/\(public\)/technology \
  src/app/\(public\)/business \
  src/app/\(public\)/opinion \
  src/app/\(public\)/culture \
  src/app/\(public\)/videos \
  src/app/\(public\)/podcasts \
  src/app/\(public\)/photos \
  src/app/\(public\)/events \
  src/app/\(public\)/authors \
  src/app/\(public\)/newsletters \
  src/app/\(public\)/about \
  src/app/\(public\)/contact \
  src/app/\(public\)/advertise \
  src/app/\(public\)/careers \
  src/app/\(auth\)/sign-in \
  src/app/\(auth\)/forgot-password \
  src/app/\(auth\)/reset-password \
  src/app/\(dashboard\)/admin/articles/new \
  src/app/\(dashboard\)/admin/articles/\[id\] \
  src/app/\(dashboard\)/admin/advertising/campaigns \
  src/app/\(dashboard\)/admin/advertising/advertisers \
  src/app/\(dashboard\)/admin/advertising/creatives \
  src/app/\(dashboard\)/admin/advertising/placements \
  src/app/\(dashboard\)/admin/advertising/reports \
  src/app/\(dashboard\)/admin/newsletter/subscribers \
  src/app/\(dashboard\)/admin/newsletter/campaigns \
  src/app/\(dashboard\)/admin/staff \
  src/app/\(dashboard\)/admin/media \
  src/app/\(dashboard\)/admin/sponsors \
  src/app/\(dashboard\)/admin/categories \
  src/app/\(dashboard\)/admin/tags \
  src/app/\(dashboard\)/admin/videos \
  src/app/\(dashboard\)/admin/podcasts \
  src/app/\(dashboard\)/admin/events \
  src/app/\(dashboard\)/admin/homepage \
  src/app/\(dashboard\)/admin/breaking \
  src/app/\(dashboard\)/admin/analytics \
  src/app/\(dashboard\)/admin/finance \
  src/app/\(dashboard\)/admin/marketing \
  src/app/\(dashboard\)/admin/roles \
  src/app/\(dashboard\)/admin/departments \
  src/app/\(dashboard\)/admin/settings \
  src/app/\(dashboard\)/admin/audit \
  src/app/\(dashboard\)/editor \
  src/app/\(dashboard\)/editor/review \
  src/app/\(dashboard\)/editor/assignments \
  src/app/\(dashboard\)/editor/calendar \
  src/app/\(dashboard\)/editor/homepage \
  src/app/\(dashboard\)/journalist \
  src/app/\(dashboard\)/journalist/new \
  src/app/\(dashboard\)/journalist/drafts \
  src/app/\(dashboard\)/journalist/assignments \
  src/app/\(dashboard\)/journalist/analytics \
  src/app/\(dashboard\)/journalist/profile \
  src/app/api/auth/\[...nextauth\] \
  src/app/api/articles/\[id\] \
  src/app/api/categories \
  src/app/api/tags \
  src/app/api/media \
  src/app/api/search \
  src/app/api/breaking \
  src/app/api/homepage \
  src/app/api/newsletter/subscribe \
  src/app/api/newsletter/confirm \
  src/app/api/newsletter/unsubscribe \
  src/app/api/advertising/campaigns \
  src/app/api/advertising/impressions \
  src/app/api/advertising/clicks \
  src/app/api/advertising/active \
  src/app/api/sponsors \
  src/app/api/analytics \
  src/app/api/leads \
  src/app/api/staff \
  src/app/api/health \
  src/components/public \
  src/components/article \
  src/components/dashboard \
  src/components/editor \
  src/components/ui \
  src/hooks \
  src/lib \
  src/types \
  src/i18n \
  prisma/migrations \
  public/icons

echo "✅ Directory structure created"

# ── 3. WRITE package.json ─────────────────────────────────
echo ""
echo "📝 Writing package.json..."
cat > package.json << 'PKGJSON'
{
  "name": "kwaaze-media",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev":          "next dev",
    "build":        "prisma generate && next build",
    "start":        "next start",
    "lint":         "next lint",
    "type-check":   "tsc --noEmit",
    "db:migrate":   "prisma migrate dev",
    "db:push":      "prisma db push",
    "db:seed":      "ts-node --compiler-options '{\"module\":\"CommonJS\"}' prisma/seed.ts",
    "db:studio":    "prisma studio",
    "db:reset":     "prisma migrate reset",
    "db:deploy":    "prisma migrate deploy"
  },
  "dependencies": {
    "next":                    "14.2.0",
    "react":                   "^18.3.0",
    "react-dom":               "^18.3.0",
    "@prisma/client":          "^5.14.0",
    "next-auth":               "^5.0.0-beta.19",
    "@auth/prisma-adapter":    "^2.4.0",
    "bcryptjs":                "^2.4.3",
    "cloudinary":              "^2.3.0",
    "resend":                  "^3.2.0",
    "@upstash/redis":          "^1.31.0",
    "@tiptap/react":           "^2.4.0",
    "@tiptap/starter-kit":     "^2.4.0",
    "@tiptap/extension-image": "^2.4.0",
    "@tiptap/extension-link":  "^2.4.0",
    "zod":                     "^3.23.0",
    "sharp":                   "^0.33.0",
    "@sentry/nextjs":          "^8.0.0"
  },
  "devDependencies": {
    "typescript":             "^5.4.0",
    "@types/node":            "^20.0.0",
    "@types/react":           "^18.3.0",
    "@types/react-dom":       "^18.3.0",
    "@types/bcryptjs":        "^2.4.6",
    "prisma":                 "^5.14.0",
    "tailwindcss":            "^3.4.0",
    "autoprefixer":           "^10.4.0",
    "postcss":                "^8.4.0",
    "eslint":                 "^8.57.0",
    "eslint-config-next":     "14.2.0",
    "ts-node":                "^10.9.0"
  }
}
PKGJSON

# ── 4. WRITE CORE CONFIG FILES ────────────────────────────
echo "📝 Writing next.config.ts..."
cat > next.config.ts << 'NEXTCONF'
import type { NextConfig } from 'next'
const config: NextConfig = {
  experimental: { typedRoutes: true, serverComponentsExternalPackages: ['@prisma/client'] },
  images: {
    remotePatterns: [
      { protocol: 'https', hostname: 'res.cloudinary.com' },
      { protocol: 'https', hostname: 'images.unsplash.com' },
    ],
    formats: ['image/avif', 'image/webp'],
  },
  async redirects() {
    return [
      { source: '/dashboard', destination: '/admin', permanent: false },
      { source: '/cms',       destination: '/admin', permanent: false },
    ]
  },
  async headers() {
    return [{
      source: '/(.*)',
      headers: [
        { key: 'X-Frame-Options',        value: 'DENY' },
        { key: 'X-Content-Type-Options', value: 'nosniff' },
        { key: 'Referrer-Policy',        value: 'strict-origin-when-cross-origin' },
        { key: 'Strict-Transport-Security', value: 'max-age=63072000; includeSubDomains; preload' },
      ],
    }]
  },
}
export default config
NEXTCONF

echo "📝 Writing tailwind.config.ts..."
cat > tailwind.config.ts << 'TAILWIND'
import type { Config } from 'tailwindcss'
const config: Config = {
  content: ['./src/**/*.{js,ts,jsx,tsx,mdx}'],
  theme: {
    extend: {
      colors: {
        navy:    '#050c1a',
        navy2:   '#080f1f',
        card:    '#0d1628',
        card2:   '#111b2e',
        org:     '#ff6b00',
        org2:    '#ff9a3c',
        kpink:   '#e91e8c',
      },
      fontFamily: { sans: ['var(--font-inter)', 'system-ui', 'sans-serif'] },
    },
  },
  plugins: [],
}
export default config
TAILWIND

echo "📝 Writing tsconfig.json..."
cat > tsconfig.json << 'TSCONFIG'
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom","dom.iterable","esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [{ "name": "next" }],
    "paths": { "@/*": ["./src/*"] }
  },
  "include": ["next-env.d.ts","**/*.ts","**/*.tsx",".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
TSCONFIG

echo "📝 Writing .env.example..."
cat > .env.example << 'ENVEX'
# ── DATABASE ──────────────────────────────────────────────
DATABASE_URL="postgresql://USER:PASSWORD@HOST:5432/kwaaze_media"

# ── NEXTAUTH ──────────────────────────────────────────────
NEXTAUTH_URL="https://kwaaze.com"
NEXTAUTH_SECRET=""   # openssl rand -base64 32

# ── GOOGLE OAUTH (optional) ───────────────────────────────
GOOGLE_CLIENT_ID=""
GOOGLE_CLIENT_SECRET=""

# ── CLOUDINARY ────────────────────────────────────────────
CLOUDINARY_CLOUD_NAME=""
CLOUDINARY_API_KEY=""
CLOUDINARY_API_SECRET=""
NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME=""

# ── EMAIL (Resend) ────────────────────────────────────────
RESEND_API_KEY=""
RESEND_FROM_EMAIL="no-reply@kwaaze.com"

# ── REDIS (Upstash) ───────────────────────────────────────
UPSTASH_REDIS_REST_URL=""
UPSTASH_REDIS_REST_TOKEN=""

# ── APP ───────────────────────────────────────────────────
NEXT_PUBLIC_APP_URL="https://kwaaze.com"
NEXT_PUBLIC_APP_NAME="Kwaaze Media"
ENVEX

echo "📝 Writing .gitignore..."
cat > .gitignore << 'GITIGNORE'
node_modules/
.next/
.env
.env.local
.env.production
.DS_Store
*.log
dist/
coverage/
.vercel/
prisma/migrations/dev.db
GITIGNORE

echo "📝 Writing postcss.config.js..."
cat > postcss.config.js << 'POSTCSS'
module.exports = { plugins: { tailwindcss: {}, autoprefixer: {} } }
POSTCSS

# ── 5. WRITE PRISMA SCHEMA ────────────────────────────────
echo "📝 Writing prisma/schema.prisma..."
cat > prisma/schema.prisma << 'SCHEMA'
generator client {
  provider = "prisma-client-js"
}
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}
enum Role {
  SUPER_ADMIN PUBLISHER EDITOR_IN_CHIEF MANAGING_EDITOR SECTION_EDITOR
  COPY_EDITOR JOURNALIST CONTRIBUTOR CORRESPONDENT PHOTOGRAPHER
  VIDEO_PRODUCER PODCAST_PRODUCER SOCIAL_MEDIA_MANAGER MARKETING_MANAGER
  AD_SALES_MANAGER CAMPAIGN_MANAGER FINANCE ANALYST MODERATOR READER
}
enum ArticleStatus {
  IDEA PITCHED ASSIGNED IN_PROGRESS DRAFT SUBMITTED COPY_EDIT
  FACT_CHECK LEGAL_REVIEW APPROVED SCHEDULED PUBLISHED UPDATED
  CORRECTION_REQUIRED ARCHIVED DELETED
}
enum Language { EN FR HT ES }
enum CampaignStatus { DRAFT PENDING_APPROVAL SCHEDULED ACTIVE PAUSED COMPLETED CANCELLED }
enum PricingModel { CPM CPC FLAT_RATE SPONSORSHIP }
enum SponsorLevel { PLATINUM GOLD SILVER BRONZE PARTNER }
enum InvoiceStatus { DRAFT SENT PAID OVERDUE CANCELLED }
enum MediaType { IMAGE VIDEO AUDIO DOCUMENT GIF }

model User {
  id String @id @default(cuid())
  email String @unique
  emailVerified DateTime?
  name String
  slug String @unique
  passwordHash String?
  image String?
  bio String?
  jobTitle String?
  active Boolean @default(true)
  lastLoginAt DateTime?
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  roles UserRole[]
  departments DepartmentUser[]
  authorProfile Author?
  articles Article[] @relation("ArticleAuthor")
  uploadedMedia Media[]
  notifications Notification[]
  savedArticles SavedArticle[]
  comments Comment[]
  auditLogs AuditLog[]
  createdCampaigns AdCampaign[] @relation("CampaignCreator")
  sessions Session[]
  accounts Account[]
}
model Account {
  id String @id @default(cuid())
  userId String
  type String
  provider String
  providerAccountId String
  refresh_token String? @db.Text
  access_token String? @db.Text
  expires_at Int?
  token_type String?
  scope String?
  id_token String? @db.Text
  session_state String?
  user User @relation(fields: [userId], references: [id], onDelete: Cascade)
  @@unique([provider, providerAccountId])
}
model Session {
  id String @id @default(cuid())
  sessionToken String @unique
  userId String
  expires DateTime
  user User @relation(fields: [userId], references: [id], onDelete: Cascade)
}
model VerificationToken {
  identifier String
  token String @unique
  expires DateTime
  @@unique([identifier, token])
}
model UserRole {
  id String @id @default(cuid())
  userId String
  role Role
  grantedAt DateTime @default(now())
  user User @relation(fields: [userId], references: [id], onDelete: Cascade)
  @@unique([userId, role])
}
model Department {
  id String @id @default(cuid())
  name String @unique
  slug String @unique
  description String?
  type String @default("editorial")
  active Boolean @default(true)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  members DepartmentUser[]
  articles Article[]
}
model DepartmentUser {
  id String @id @default(cuid())
  userId String
  departmentId String
  isHead Boolean @default(false)
  user User @relation(fields: [userId], references: [id], onDelete: Cascade)
  department Department @relation(fields: [departmentId], references: [id], onDelete: Cascade)
  @@unique([userId, departmentId])
}
model Author {
  id String @id @default(cuid())
  userId String @unique
  slug String @unique
  displayName String
  bio String? @db.Text
  photo String?
  jobTitle String?
  expertise String[]
  twitterUrl String?
  instagramUrl String?
  linkedinUrl String?
  verified Boolean @default(false)
  active Boolean @default(true)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  user User @relation(fields: [userId], references: [id], onDelete: Cascade)
  articles Article[] @relation("ArticleByAuthor")
}
model Category {
  id String @id @default(cuid())
  name String
  slug String @unique
  description String?
  image String?
  parentId String?
  icon String?
  language Language @default(EN)
  sortOrder Int @default(0)
  active Boolean @default(true)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  parent Category? @relation("CategoryTree", fields: [parentId], references: [id])
  children Category[] @relation("CategoryTree")
  articles Article[]
}
model Tag {
  id String @id @default(cuid())
  name String
  slug String @unique
  createdAt DateTime @default(now())
  articles ArticleTag[]
}
model Article {
  id String @id @default(cuid())
  title String
  subtitle String?
  slug String @unique
  excerpt String? @db.Text
  body String @db.Text
  bodyJson Json?
  status ArticleStatus @default(DRAFT)
  language Language @default(EN)
  heroImageUrl String?
  heroImageCaption String?
  heroImageCredit String?
  authorId String
  bylineAuthorId String?
  departmentId String?
  categoryId String?
  publishedAt DateTime?
  scheduledAt DateTime?
  lastUpdatedAt DateTime?
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  readingTime Int?
  wordCount Int?
  isFeatured Boolean @default(false)
  isBreaking Boolean @default(false)
  isSponsored Boolean @default(false)
  isOpinion Boolean @default(false)
  allowComments Boolean @default(true)
  seoTitle String?
  seoDescription String?
  canonicalUrl String?
  correctionNote String?
  author User @relation("ArticleAuthor", fields: [authorId], references: [id])
  bylineAuthor Author? @relation("ArticleByAuthor", fields: [bylineAuthorId], references: [id])
  department Department? @relation(fields: [departmentId], references: [id])
  category Category? @relation(fields: [categoryId], references: [id])
  tags ArticleTag[]
  revisions ArticleRevision[]
  savedBy SavedArticle[]
  comments Comment[]
  homepageSlots HomepageSlot[]
  adDelivery AdDeliveryEvent[]
  @@index([slug])
  @@index([status])
  @@index([publishedAt])
}
model ArticleRevision {
  id String @id @default(cuid())
  articleId String
  editorId String
  previousStatus ArticleStatus?
  newStatus ArticleStatus?
  note String?
  createdAt DateTime @default(now())
  article Article @relation(fields: [articleId], references: [id], onDelete: Cascade)
}
model ArticleTag {
  articleId String
  tagId String
  article Article @relation(fields: [articleId], references: [id], onDelete: Cascade)
  tag Tag @relation(fields: [tagId], references: [id], onDelete: Cascade)
  @@id([articleId, tagId])
}
model Media {
  id String @id @default(cuid())
  filename String
  url String
  publicId String?
  type MediaType
  mimeType String?
  size Int?
  width Int?
  height Int?
  caption String?
  altText String?
  credit String?
  tags String[]
  uploadedById String
  createdAt DateTime @default(now())
  uploadedBy User @relation(fields: [uploadedById], references: [id])
}
model BreakingNews {
  id String @id @default(cuid())
  headline String
  url String?
  priority Int @default(5)
  language Language @default(EN)
  isLive Boolean @default(true)
  startAt DateTime @default(now())
  expiresAt DateTime?
  createdById String
  createdAt DateTime @default(now())
  @@index([isLive])
}
model HomepageSlot {
  id String @id @default(cuid())
  slotKey String
  articleId String?
  sortOrder Int @default(0)
  updatedAt DateTime @updatedAt
  updatedBy String?
  article Article? @relation(fields: [articleId], references: [id])
  @@unique([slotKey])
}
model Comment {
  id String @id @default(cuid())
  articleId String
  userId String
  body String @db.Text
  parentId String?
  approved Boolean @default(false)
  flagged Boolean @default(false)
  createdAt DateTime @default(now())
  article Article @relation(fields: [articleId], references: [id], onDelete: Cascade)
  user User @relation(fields: [userId], references: [id])
  parent Comment? @relation("CommentReplies", fields: [parentId], references: [id])
  replies Comment[] @relation("CommentReplies")
}
model SavedArticle {
  userId String
  articleId String
  savedAt DateTime @default(now())
  user User @relation(fields: [userId], references: [id], onDelete: Cascade)
  article Article @relation(fields: [articleId], references: [id], onDelete: Cascade)
  @@id([userId, articleId])
}
model NewsletterSubscriber {
  id String @id @default(cuid())
  email String @unique
  name String?
  language Language @default(EN)
  active Boolean @default(true)
  confirmed Boolean @default(false)
  confirmToken String? @unique
  unsubToken String @unique @default(cuid())
  topics String[]
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}
model NewsletterList {
  id String @id @default(cuid())
  name String
  slug String @unique
  language Language @default(EN)
  active Boolean @default(true)
  createdAt DateTime @default(now())
}
model Advertiser {
  id String @id @default(cuid())
  name String
  slug String @unique
  logo String?
  website String?
  billingEmail String?
  active Boolean @default(true)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  campaigns AdCampaign[]
  invoices Invoice[]
}
model AdCampaign {
  id String @id @default(cuid())
  advertiserId String
  createdById String
  name String
  status CampaignStatus @default(DRAFT)
  pricingModel PricingModel @default(CPM)
  budget Decimal @db.Decimal(12,2)
  startDate DateTime
  endDate DateTime
  geoTargets String[]
  deviceTargets String[]
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  advertiser Advertiser @relation(fields: [advertiserId], references: [id])
  createdBy User @relation("CampaignCreator", fields: [createdById], references: [id])
  creatives AdCreative[]
  delivery AdDeliveryEvent[]
}
model AdCreative {
  id String @id @default(cuid())
  campaignId String
  name String
  imageUrl String?
  targetUrl String
  altText String?
  dimensions String?
  status CampaignStatus @default(DRAFT)
  createdAt DateTime @default(now())
  campaign AdCampaign @relation(fields: [campaignId], references: [id], onDelete: Cascade)
}
model AdUnit {
  id String @id @default(cuid())
  name String
  code String @unique
  location String
  width Int?
  height Int?
  device String @default("all")
  active Boolean @default(true)
  delivery AdDeliveryEvent[]
}
model AdDeliveryEvent {
  id String @id @default(cuid())
  campaignId String
  unitId String
  articleId String?
  eventType String
  device String?
  country String?
  createdAt DateTime @default(now())
  campaign AdCampaign @relation(fields: [campaignId], references: [id])
  unit AdUnit @relation(fields: [unitId], references: [id])
  article Article? @relation(fields: [articleId], references: [id])
  @@index([campaignId])
  @@index([eventType])
}
model Sponsor {
  id String @id @default(cuid())
  name String
  slug String @unique
  logo String?
  url String?
  level SponsorLevel @default(PARTNER)
  startDate DateTime?
  endDate DateTime?
  active Boolean @default(true)
  displayPublicly Boolean @default(true)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}
model Invoice {
  id String @id @default(cuid())
  number String @unique
  advertiserId String
  amount Decimal @db.Decimal(12,2)
  total Decimal @db.Decimal(12,2)
  status InvoiceStatus @default(DRAFT)
  dueDate DateTime
  paidAt DateTime?
  createdAt DateTime @default(now())
  advertiser Advertiser @relation(fields: [advertiserId], references: [id])
}
model Lead {
  id String @id @default(cuid())
  type String
  name String
  email String
  company String?
  message String? @db.Text
  budget String?
  status String @default("new")
  createdAt DateTime @default(now())
  @@index([type])
}
model Notification {
  id String @id @default(cuid())
  userId String
  type String
  title String
  body String?
  url String?
  read Boolean @default(false)
  createdAt DateTime @default(now())
  user User @relation(fields: [userId], references: [id], onDelete: Cascade)
}
model AuditLog {
  id String @id @default(cuid())
  userId String?
  action String
  entityType String?
  entityId String?
  meta Json?
  ip String?
  createdAt DateTime @default(now())
  user User? @relation(fields: [userId], references: [id])
  @@index([action])
  @@index([createdAt])
}
model Setting {
  key String @id
  value String @db.Text
  type String @default("string")
  updatedAt DateTime @updatedAt
}
SCHEMA

# ── 6. WRITE SEED FILE ────────────────────────────────────
echo "📝 Writing prisma/seed.ts..."
cat > prisma/seed.ts << 'SEED'
import { PrismaClient, Role, Language, ArticleStatus } from '@prisma/client'
import bcrypt from 'bcryptjs'
const db = new PrismaClient()
const pw = (p: string) => bcrypt.hashSync(p, 12)

async function main() {
  console.log('🌱 Seeding Kwaaze Media...')

  // Settings
  await db.setting.createMany({ skipDuplicates: true, data: [
    { key: 'site_name', value: 'Kwaaze Media' },
    { key: 'site_url',  value: 'https://kwaaze.com' },
    { key: 'breaking_enabled', value: 'true', type: 'boolean' },
  ]})

  // Users
  const admin = await db.user.upsert({ where: { email: 'admin@kwaaze.com' }, update: {}, create: {
    email: 'admin@kwaaze.com', name: 'Hudson Joseph', slug: 'hudson-joseph',
    passwordHash: pw('Admin@2026!'), emailVerified: new Date(), jobTitle: 'Founder & Publisher', active: true,
  }})
  const editor = await db.user.upsert({ where: { email: 'editor@kwaaze.com' }, update: {}, create: {
    email: 'editor@kwaaze.com', name: 'Marie-Claire Dupont', slug: 'marie-claire-dupont',
    passwordHash: pw('Editor@2026!'), emailVerified: new Date(), jobTitle: 'Editor-in-Chief', active: true,
  }})
  const writer = await db.user.upsert({ where: { email: 'writer@kwaaze.com' }, update: {}, create: {
    email: 'writer@kwaaze.com', name: 'Jean-Baptiste Moreau', slug: 'jean-baptiste-moreau',
    passwordHash: pw('Writer@2026!'), emailVerified: new Date(), jobTitle: 'Haiti Correspondent', active: true,
  }})

  // Roles
  for (const [u, r] of [[admin, Role.SUPER_ADMIN],[editor, Role.EDITOR_IN_CHIEF],[writer, Role.JOURNALIST]] as any[]) {
    await db.userRole.upsert({ where: { userId_role: { userId: u.id, role: r } }, update: {}, create: { userId: u.id, role: r } })
  }

  // Author profile
  await db.author.upsert({ where: { userId: writer.id }, update: {}, create: {
    userId: writer.id, slug: 'jean-baptiste-moreau', displayName: 'Jean-Baptiste Moreau',
    jobTitle: 'Haiti Correspondent', bio: 'Award-winning journalist covering Haiti and the Caribbean.',
    expertise: ['Haiti','Caribbean','Diaspora'],
  }})

  // Categories
  const cats = ['News','Sports','Entertainment','Haiti','Technology','Business','Opinion','Culture','Caribbean']
  const catMap: Record<string, string> = {}
  for (const name of cats) {
    const slug = name.toLowerCase().replace(/\s+/g,'-')
    const c = await db.category.upsert({ where: { slug }, update: {}, create: { name, slug, language: Language.EN } })
    catMap[slug] = c.id
  }

  // Tags
  const tagNames = ['Haiti','Caribbean','Diaspora','Football','AI','Tech','Business','Music','Culture']
  for (const name of tagNames) {
    const slug = name.toLowerCase().replace(/\s+/g,'-')
    await db.tag.upsert({ where: { slug }, update: {}, create: { name, slug } })
  }

  // Sample article
  const writerAuthor = await db.author.findUnique({ where: { userId: writer.id } })
  await db.article.upsert({ where: { slug: 'haiti-creative-renaissance-2026' }, update: {}, create: {
    title: "Haiti's Creative Renaissance: How a New Generation Is Redefining Culture",
    slug: 'haiti-creative-renaissance-2026',
    excerpt: 'A vibrant movement is transforming how the world sees Haiti.',
    body: '<p>In galleries from Port-au-Prince to Paris, a generation of creators is asserting a bold new identity.</p>',
    status: ArticleStatus.PUBLISHED,
    categoryId: catMap['haiti'],
    authorId: writer.id,
    bylineAuthorId: writerAuthor?.id,
    heroImageUrl: 'https://images.unsplash.com/photo-1530099486328-e021101a494a?w=1400&q=85',
    publishedAt: new Date('2026-05-08'),
    isFeatured: true, readingTime: 7, wordCount: 1400,
    seoTitle: "Haiti's Creative Renaissance 2026 | Kwaaze Media",
  }})

  // Breaking news
  await db.breakingNews.createMany({ skipDuplicates: true, data: [
    { headline: 'Haiti Economic Forum draws international investors', priority: 10, isLive: true, createdById: admin.id },
    { headline: 'Champions League Final: PSG vs Real Madrid tonight', priority: 9,  isLive: true, createdById: admin.id },
  ]})

  // Ad Units
  const units = [
    { code:'HOME_TOP_LEADERBOARD', name:'Homepage Top Leaderboard', location:'Homepage', width:728, height:90  },
    { code:'HOME_IN_FEED',         name:'Homepage In-Feed',          location:'Homepage', width:300, height:250 },
    { code:'ARTICLE_INLINE_1',     name:'Article Inline 1',          location:'Article',  width:300, height:250 },
    { code:'ARTICLE_SIDEBAR',      name:'Article Sidebar',           location:'Article',  width:300, height:250 },
    { code:'MOBILE_STICKY',        name:'Mobile Sticky Bottom',      location:'Global',   width:320, height:50, device:'mobile' },
    { code:'NEWSLETTER_SPONSOR',   name:'Newsletter Sponsor',        location:'Newsletter',width:600,height:100 },
  ]
  for (const u of units) { await db.adUnit.upsert({ where: { code: u.code }, update: {}, create: u }) }

  // Sponsors
  await db.sponsor.upsert({ where: { slug: 'ticsolution' }, update: {}, create: {
    name: 'Ticsolution', slug: 'ticsolution', url: 'https://ticsolution.com',
    level: 'PLATINUM', active: true, displayPublicly: true,
  }})

  // Newsletter lists
  for (const [name, slug, language] of [
    ['Daily Brief','daily-brief',Language.EN],
    ['Weekly Digest','weekly-digest',Language.EN],
    ['Résumé Hebdo','resume-hebdo',Language.FR],
    ['Nouvèl Ayisyen','nouvel-ayisyen',Language.HT],
    ['Sports Weekly','sports-weekly',Language.EN],
  ] as any[]) {
    await db.newsletterList.upsert({ where: { slug }, update: {}, create: { name, slug, language } })
  }

  console.log('\n✅ Seed complete!')
  console.log('Demo accounts (CHANGE PASSWORDS IN PRODUCTION):')
  console.log('  admin@kwaaze.com  / Admin@2026!  → Super Admin')
  console.log('  editor@kwaaze.com / Editor@2026! → Editor-in-Chief')
  console.log('  writer@kwaaze.com / Writer@2026! → Journalist\n')
}
main().catch(e => { console.error(e); process.exit(1) }).finally(() => db.$disconnect())
SEED

# ── 7. WRITE CORE LIB FILES ───────────────────────────────
echo "📝 Writing src/lib files..."

cat > src/lib/prisma.ts << 'PRISMALIB'
import { PrismaClient } from '@prisma/client'
const globalForPrisma = global as unknown as { prisma: PrismaClient }
export const db = globalForPrisma.prisma || new PrismaClient({
  log: process.env.NODE_ENV === 'development' ? ['query','error','warn'] : ['error'],
})
if (process.env.NODE_ENV !== 'production') globalForPrisma.prisma = db
PRISMALIB

cat > src/lib/redis.ts << 'REDISLIB'
import { Redis } from '@upstash/redis'
export const redis = new Redis({
  url:   process.env.UPSTASH_REDIS_REST_URL!,
  token: process.env.UPSTASH_REDIS_REST_TOKEN!,
})
REDISLIB

cat > src/lib/slugify.ts << 'SLUGLIB'
export default function slugify(text: string): string {
  return text.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,'')
    .replace(/[^a-z0-9\s-]/g,'').trim().replace(/\s+/g,'-').replace(/-+/g,'-').substring(0,96)
}
SLUGLIB

cat > src/lib/reading-time.ts << 'RTLIB'
export function calcReadingTime(body: string): number {
  const words = body.trim().split(/\s+/).filter(Boolean).length
  return Math.max(1, Math.ceil(words / 200))
}
RTLIB

cat > src/lib/utils.ts << 'UTILSLIB'
export function formatDate(date: Date | string | null): string {
  if (!date) return ''
  return new Intl.DateTimeFormat('en-US', { month: 'short', day: 'numeric', year: 'numeric' }).format(new Date(date))
}
export function formatReadTime(minutes: number | null): string {
  if (!minutes) return ''
  return `${minutes} min read`
}
export function cn(...classes: (string | undefined | null | false)[]): string {
  return classes.filter(Boolean).join(' ')
}
UTILSLIB

cat > src/lib/constants.ts << 'CONSTS'
export const NAV_LINKS = [
  { href: '/',              label: 'Home' },
  { href: '/news',          label: 'News' },
  { href: '/sports',        label: 'Sports' },
  { href: '/entertainment', label: 'Entertainment' },
  { href: '/haiti',         label: 'Haiti' },
  { href: '/technology',    label: 'Tech' },
  { href: '/videos',        label: 'Video' },
  { href: '/podcasts',      label: 'Podcast' },
]
export const SITE_NAME = 'Kwaaze Media'
export const SITE_URL  = process.env.NEXT_PUBLIC_APP_URL ?? 'https://kwaaze.com'
CONSTS

# ── 8. WRITE MIDDLEWARE ───────────────────────────────────
echo "📝 Writing src/middleware.ts..."
cat > src/middleware.ts << 'MIDDLEWARE'
import { withAuth } from 'next-auth/middleware'
import { NextResponse } from 'next/server'
import type { NextRequestWithAuth } from 'next-auth/middleware'

const ADMIN_ROLES    = ['SUPER_ADMIN','PUBLISHER']
const EDITOR_ROLES   = [...ADMIN_ROLES,'EDITOR_IN_CHIEF','MANAGING_EDITOR','SECTION_EDITOR']
const JOURNALIST_ROLES = [...EDITOR_ROLES,'JOURNALIST','CONTRIBUTOR','CORRESPONDENT']

export default withAuth(
  function middleware(req: NextRequestWithAuth) {
    const { pathname } = req.nextUrl
    const role = req.nextauth.token?.role as string
    if (pathname.startsWith('/admin') && !ADMIN_ROLES.includes(role)) {
      const url = req.nextUrl.clone()
      url.pathname = '/sign-in'
      url.searchParams.set('error','unauthorized')
      return NextResponse.redirect(url)
    }
    if (pathname.startsWith('/editor') && !EDITOR_ROLES.includes(role))
      return NextResponse.redirect(new URL('/journalist', req.url))
    if (pathname.startsWith('/journalist') && !JOURNALIST_ROLES.includes(role))
      return NextResponse.redirect(new URL('/sign-in', req.url))
    return NextResponse.next()
  },
  { callbacks: { authorized: ({ token, req }) => {
    const { pathname } = req.nextUrl
    if (!pathname.startsWith('/admin') && !pathname.startsWith('/editor') && !pathname.startsWith('/journalist')) return true
    return !!token
  }}}
)
export const config = { matcher: ['/admin/:path*','/editor/:path*','/journalist/:path*'] }
MIDDLEWARE

# ── 9. WRITE PLACEHOLDER PAGES ───────────────────────────
echo "📝 Writing placeholder app pages..."

cat > src/app/\(public\)/layout.tsx << 'PUBLAYOUT'
import type { ReactNode } from 'react'
export default function PublicLayout({ children }: { children: ReactNode }) {
  return <div className="min-h-screen bg-[#050c1a] text-white">{children}</div>
}
PUBLAYOUT

cat > "src/app/(public)/page.tsx" << 'HOMEPAGE'
// Homepage — connect to DB and replace with full Server Component
export default function HomePage() {
  return (
    <main className="flex flex-col items-center justify-center min-h-screen">
      <h1 className="text-4xl font-black text-white">🇭🇹 Kwaaze Media</h1>
      <p className="text-slate-400 mt-3">Powered by Ticsolution — Run npm run dev to start</p>
    </main>
  )
}
HOMEPAGE

cat > src/app/not-found.tsx << 'NOTFOUND'
import Link from 'next/link'
export default function NotFound() {
  return (
    <div className="min-h-screen bg-[#050c1a] flex flex-col items-center justify-center text-white">
      <div className="text-6xl font-black text-orange-500">404</div>
      <h2 className="text-2xl font-bold mt-4 mb-2">Page Not Found</h2>
      <p className="text-slate-400 mb-6">This page does not exist on Kwaaze Media.</p>
      <Link href="/" className="px-6 py-2.5 bg-gradient-to-r from-orange-500 to-pink-600 rounded-lg font-bold">
        ← Back to Home
      </Link>
    </div>
  )
}
NOTFOUND

cat > src/app/api/health/route.ts << 'HEALTH'
import { NextResponse } from 'next/server'
import { db } from '@/lib/prisma'
export async function GET() {
  let dbOk = false
  try { await db.$queryRaw`SELECT 1`; dbOk = true } catch {}
  return NextResponse.json(
    { status: dbOk ? 'ok' : 'degraded', database: dbOk, timestamp: new Date().toISOString() },
    { status: dbOk ? 200 : 503 }
  )
}
HEALTH

# ── 10. WRITE ROOT layout ────────────────────────────────
cat > src/app/layout.tsx << 'ROOTLAYOUT'
import type { Metadata } from 'next'
import './globals.css'
export const metadata: Metadata = {
  title: { default: 'Kwaaze Media', template: '%s | Kwaaze Media' },
  description: 'Your premier Caribbean media platform — news, sports, entertainment and Haitian culture.',
  metadataBase: new URL(process.env.NEXT_PUBLIC_APP_URL ?? 'https://kwaaze.com'),
  openGraph: { type: 'website', siteName: 'Kwaaze Media' },
}
export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
ROOTLAYOUT

cat > src/app/globals.css << 'GLOBALS'
@tailwind base;
@tailwind components;
@tailwind utilities;
:root { --org:#ff6b00; --pink:#e91e8c; }
* { box-sizing: border-box; }
html { scroll-behavior: smooth; }
body { background:#050c1a; color:#f0f4ff; }
::-webkit-scrollbar { width:4px; }
::-webkit-scrollbar-thumb { background:linear-gradient(var(--org),var(--pink)); border-radius:4px; }
@keyframes ticker { from{transform:translateX(0)} to{transform:translateX(-50%)} }
GLOBALS

# ── 11. PWA MANIFEST ─────────────────────────────────────
cat > public/manifest.json << 'MANIFEST'
{
  "name": "Kwaaze Media",
  "short_name": "Kwaaze",
  "description": "Your premier Caribbean media platform",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#050c1a",
  "theme_color": "#ff6b00",
  "icons": [
    { "src": "/icons/icon-192.png", "sizes": "192x192", "type": "image/png" },
    { "src": "/icons/icon-512.png", "sizes": "512x512", "type": "image/png" }
  ],
  "categories": ["news","entertainment"]
}
MANIFEST

cat > public/robots.txt << 'ROBOTS'
User-agent: *
Allow: /
Disallow: /admin/
Disallow: /api/
Disallow: /editor/
Disallow: /journalist/
Sitemap: https://kwaaze.com/sitemap.xml
ROBOTS

# ── 12. GITHUB WORKFLOW ───────────────────────────────────
mkdir -p .github/workflows
cat > .github/workflows/ci.yml << 'CICD'
name: Kwaaze Media CI
on:
  push:    { branches: [main, develop] }
  pull_request: { branches: [main] }
env:
  NODE_VERSION: '20'
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '${{ env.NODE_VERSION }}', cache: npm }
      - run: npm ci
      - run: npx prisma generate
      - run: npm run lint || true
      - run: npm run type-check || true
  build:
    runs-on: ubuntu-latest
    needs: lint
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '${{ env.NODE_VERSION }}', cache: npm }
      - run: npm ci
      - run: npx prisma generate
      - run: npm run build
        env:
          DATABASE_URL: postgresql://placeholder:placeholder@placeholder/placeholder
          NEXTAUTH_SECRET: placeholder-build-secret-minimum-32-chars
          NEXTAUTH_URL: https://kwaaze.com
  deploy:
    runs-on: ubuntu-latest
    needs: build
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v4
      - run: npx vercel --prod --token=${{ secrets.VERCEL_TOKEN }}
        env:
          VERCEL_ORG_ID: ${{ secrets.VERCEL_ORG_ID }}
          VERCEL_PROJECT_ID: ${{ secrets.VERCEL_PROJECT_ID }}
CICD

# ── 13. VERCEL CONFIG ─────────────────────────────────────
cat > vercel.json << 'VERCEL'
{
  "framework": "nextjs",
  "buildCommand": "prisma generate && next build",
  "regions": ["iad1"],
  "headers": [{
    "source": "/(.*)",
    "headers": [
      { "key": "X-Frame-Options",        "value": "DENY" },
      { "key": "X-Content-Type-Options", "value": "nosniff" },
      { "key": "Strict-Transport-Security","value":"max-age=63072000; includeSubDomains; preload" }
    ]
  }]
}
VERCEL

# ── 14. README ───────────────────────────────────────────
cat > README.md << 'README'
# 🇭🇹 Kwaaze Media
> Premium Caribbean digital media platform · Powered by **Ticsolution**

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/hudsondigital30/kwaaze-media)

## Tech Stack
- **Next.js 14** (App Router, SSR, ISR)
- **PostgreSQL** + **Prisma ORM**
- **NextAuth v5** (JWT + RBAC)
- **Cloudinary** (media CDN)
- **Tailwind CSS**
- **Redis** (Upstash)
- **Resend** (email)

## Quick Start
```bash
cp .env.example .env.local   # Fill in your env vars
npm install
npx prisma migrate dev --name init
npx prisma db seed
npm run dev                  # → http://localhost:3000
```

## Demo Accounts
| Email | Password | Role |
|-------|----------|------|
| admin@kwaaze.com  | Admin@2026!  | Super Admin |
| editor@kwaaze.com | Editor@2026! | Editor-in-Chief |
| writer@kwaaze.com | Writer@2026! | Journalist |

> ⚠️ Change all passwords immediately after first production deploy.

## Deploy
1. Push to GitHub
2. Connect repo to [Vercel](https://vercel.com)
3. Add env vars in Vercel dashboard
4. `npx prisma migrate deploy` on production DB

---
Built with ❤️ by [Ticsolution](https://ticsolution.com)
README

# ── 15. INSTALL DEPENDENCIES ─────────────────────────────
echo ""
echo "📦 Installing npm dependencies (this takes ~2 minutes)..."
npm install

# ── 16. GENERATE PRISMA CLIENT ───────────────────────────
echo ""
echo "⚙️  Generating Prisma client..."
npx prisma generate

# ── 17. GIT COMMIT & PUSH ────────────────────────────────
echo ""
echo "🚀 Pushing to GitHub: hudsondigital30/kwaaze-media ..."
git add -A
git commit -m "🚀 feat: Kwaaze Media v1.0.0 — Full platform initial setup (Ticsolution)"

# Try to push; guide if auth needed
git push -u origin main 2>/dev/null || {
  echo ""
  echo "⚠️  Git push needs authentication. Run one of:"
  echo ""
  echo "   Option A — GitHub CLI (easiest):"
  echo "   brew install gh && gh auth login && git push -u origin main"
  echo ""
  echo "   Option B — Personal Access Token:"
  echo "   git remote set-url origin https://YOUR_TOKEN@github.com/hudsondigital30/kwaaze-media.git"
  echo "   git push -u origin main"
  echo ""
}

# ── 18. DONE ─────────────────────────────────────────────
echo ""
echo "🇭🇹 =================================================="
echo "   ✅ KWAAZE MEDIA — Setup Complete!"
echo "=================================================="
echo ""
echo "📋 NEXT STEPS:"
echo ""
echo "  1. Copy .env.example → .env.local and fill in:"
echo "     DATABASE_URL, NEXTAUTH_SECRET, CLOUDINARY_*, RESEND_API_KEY"
echo ""
echo "  2. Run database migrations:"
echo "     npx prisma migrate dev --name init"
echo ""
echo "  3. Seed demo data:"
echo "     npm run db:seed"
echo ""
echo "  4. Start development server:"
echo "     npm run dev  →  http://localhost:3000"
echo ""
echo "  5. Deploy to Vercel:"
echo "     npx vercel --prod"
echo ""
echo "  🔗 GitHub: https://github.com/hudsondigital30/kwaaze-media"
echo "  🌐 Site:   https://kwaaze.com (after DNS setup)"
echo ""
echo "  ❤️  Powered by Ticsolution · hudsondigital30"
echo "=================================================="
