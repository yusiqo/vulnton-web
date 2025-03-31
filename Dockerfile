# Node.js ve Yarn içeren bir temel imaj kullan
FROM node:lts

# Çalışma dizinini belirle
WORKDIR /app

# package.json ve yarn.lock'u kopyala ve bağımlılıkları yükle
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Proje dosyalarını kopyala
COPY . .

# Yapıyı oluştur
RUN yarn dist

# Nginx kullanarak dağıtımı yap
FROM nginx:latest
COPY --from=0 /app/webapp /usr/share/nginx/html

# Nginx için varsayılan port
EXPOSE 80

# Nginx başlat
CMD ["nginx", "-g", "daemon off;"]
