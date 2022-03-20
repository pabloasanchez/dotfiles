echo ""
echo "================================"
echo "  Commands                      "
echo "================================"
echo ""
awk '{print $2 }' aliases.sh | sed -r 's/=.+//'

