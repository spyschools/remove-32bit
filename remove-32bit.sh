#!/bin/bash
# Script hapus dukungan 32-bit (i386) di Kali Linux
# Tested on Debian/Ubuntu/Kali

echo "[*] Mengecek arsitektur aktif..."
dpkg --print-foreign-architectures

echo "[*] Menghapus arsitektur i386..."
sudo dpkg --remove-architecture i386 2>/dev/null

echo "[*] Membersihkan paket i386 yang sudah terpasang..."
sudo apt purge '.*:i386' -y

echo "[*] Autoremove paket yang tidak terpakai..."
sudo apt autoremove -y
sudo apt autoclean -y

echo "[*] Update database paket..."
sudo apt update

echo ""
echo "[+] Selesai. Sekarang sistem hanya 64-bit."
echo "[i] Verifikasi dengan: dpkg --print-foreign-architectures"
echo "    Jika kosong → berarti i386 sudah terhapus."
