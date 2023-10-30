import requests, sys
from bs4 import BeautifulSoup

url = sys.argv[1]


# URL of the Dark Reader extension page
#url = "https://addons.mozilla.org/en-US/firefox/addon/darkreader/"
#print("url:", url)

# Send an HTTP GET request
response = requests.get(url)

# Parse the HTML content using Beautiful Soup
soup = BeautifulSoup(response.content, "html.parser")
#print("soup?? =>", soup)

# Find the "Add to Firefox" button
add_to_firefox_button = soup.find("a", class_="InstallButtonWrapper-download-link")

#print("find?? =>", add_to_firefox_button)

if add_to_firefox_button:
    # Get the href attribute of the button
    download_link = add_to_firefox_button.get("href")
    print(download_link)
else:
    print("NOT_FOUND")
