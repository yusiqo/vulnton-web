# Node.js ve Yarn içeren bir temel imaj kullan
FROM node:lts

# Çalışma dizinini belirle
WORKDIR /app

# package.json ve yarn.lock'u önce kopyala
COPY package.json yarn.lock ./

# Bağımlılıkları yükle (önbelleğe alınır)
RUN yarn install --frozen-lockfile

# `concurrently` paketinin projeye yüklü olduğundan emin ol
RUN yarn add concurrently

# Proje dosyalarını kopyala
COPY . .

# Uygulamayı başlat
CMD ["yarn", "start"]
