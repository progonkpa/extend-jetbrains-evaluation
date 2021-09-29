for product in IntelliJIdea WebStorm DataGrip PhpStorm CLion PyCharm GoLand RubyMine; do
  echo "Resetting trial period for $product"

  echo "removing evaluation key..."
  rm -rf ~/.config/$product*/eval 2> /dev/null

  # Above path not working on latest version. Fixed below
  rm -rf ~/.config/JetBrains/$product*/eval 2> /dev/null

  echo "removing options/updates.xml..."
  rm -rf ~/.config/JetBrains/$product*/options/updates.xml 2> /dev/null

  echo "removing all evlsprt properties in options.xml..."
  sed -i 's/evlsprt//' ~/.config/$product*/options/other.xml 2> /dev/null

  # Above path not working on latest version. Fixed below
  sed -i 's/evlsprt//' ~/.config/JetBrains/$product*/options/other.xml 2> /dev/null
  echo
done

echo "removing userPrefs files..."
rm -rf ~/.java/.userPrefs 2> /dev/null

# I think these host file entries are supposed to block the application from
# calling home but if set, you will not be able to surf to JetBrains' website
# or its forum  and it might break plugin market.
#
# echo && echo - - - && echo
#
# echo -e "Run this command to block JetBrains calling home.
#
# sudo cat << EOF >> /etc/hosts
#
# # Jetbrains evaluation
# 127.0.0.1 www.jetbrains.com
# 127.0.0.1 plugins.jetbrains.com
# EOF"
