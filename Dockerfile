# Node.js ve Yarn içeren bir temel imaj kullan
FROM node:lts

# Çalışma dizinini belirle
WORKDIR /app

# package.json ve yarn.lock'u kopyala ve bağımlılıkları yükle
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# concurrently'yi proje bağımlılığı olarak ekle
RUN yarn add concurrently

# Proje dosyalarını kopyala
COPY . .

# Uygulamayı başlat
CMD ["yarn", "start"]