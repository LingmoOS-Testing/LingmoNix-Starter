echo "Welcome to LingmoNix Installer!"
echo "LingmoNix is licensed under GPL-3.0 license."
echo "COPYRIGHT 2024 Yaksha Project."
sleep 2s
echo ""
echo "Installing LingmoNix..."
sudo cp -r ~/yaksha/* /etc/nixos/
sudo nixos-rebuild switch

echo "System upgraded to the latest!"
echo "ENJOY YOUR SYSTEM, after you reboot it. :)"
