'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "c527cade41b33b6224293eb478fcf8bd",
"index.html": "89cf3e36319f9b7acce9868c6cc4a1cc",
"/": "89cf3e36319f9b7acce9868c6cc4a1cc",
"main.dart.js": "aa37f7559f222c5d3b25e25d095791b6",
"404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "555936734316167a25c7386690357e47",
"assets/AssetManifest.json": "b6db580a26f955c15cd18d8cd9d0feb2",
"assets/NOTICES": "e8c12ed33612a78aa78bb702ba590e9f",
"assets/FontManifest.json": "d1a00b2f1365b55d6ff600a89350e9f3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "87c19a4ced708480e9e5ced34e1be4f6",
"assets/fonts/MaterialIcons-Regular.otf": "519f0e8b414630f88e8a5ede12ddd7db",
"assets/assets/images/Categories1.png": "44695b831d852b847ca1ec851065050f",
"assets/assets/images/wallpaperpre5.png": "56adf1b8799e1a4aea74c0a2b395b1a7",
"assets/assets/images/homeIcon.png": "9b955af88ef62cf6204f508f5f943dc8",
"assets/assets/images/wallpaperpre4.png": "ec10e7941ccc12efff993d379729f870",
"assets/assets/images/Categories2.png": "5ccfd163433dcd6198bb997c2037d1b8",
"assets/assets/images/telegram.png": "596d74fed827cf406cbd2a4f0d8f00b2",
"assets/assets/images/wallpaperpre6.png": "c594ccac1a15ca5719020f0613604ec9",
"assets/assets/images/wallpaperpre7.png": "0348f4eed1a24776fa1c6cf1a0b48c43",
"assets/assets/images/Categories3.png": "f777effd7fd0c99148bcbf6c32f4e4fd",
"assets/assets/images/SelectLikeIcon.png": "5490c472d28a8cf4059b14082cfdaf78",
"assets/assets/images/Categories7.png": "52f58acf8988d7c5a92b3610fff48736",
"assets/assets/images/xrecorder.png": "37fd0edcf22df4d3f43cc0a30d146031",
"assets/assets/images/cinema.png": "ae4d3c6d52577b1338d6b213d67b7481",
"assets/assets/images/download.jpg": "ffdbfadf6e15b2939ec3b594103a287e",
"assets/assets/images/gallery.png": "f4bebf1ea6b8567517195b35cb429143",
"assets/assets/images/wallpaperpre3.png": "3d801496c76a034a03f2f6a46107f4f9",
"assets/assets/images/wallpaperpre2.png": "eb470e0a1c20809fb400abc71d20ae19",
"assets/assets/images/postIcon.png": "90206ede39bef0cada93b2ed092b18fa",
"assets/assets/images/spleashButtonIcon.png": "f2cca5c328a83fc9dc0dcdea31cbee26",
"assets/assets/images/Categories6.png": "94e5f77d2dee3c3ad2b95db8e7ffe51a",
"assets/assets/images/Categories4.png": "81fe658d0bcd79283031cb72652dfe75",
"assets/assets/images/hotstar.jpg": "59e0321b4276c8e848a254dd61997e48",
"assets/assets/images/wallpaper9.png": "13fe098ef88f96efb6dc07fce4680328",
"assets/assets/images/wallpaperpre1.png": "7c58e75693ccd63d7df28e1e31e087fa",
"assets/assets/images/appLogo.png": "0cee6f78114f4f3172b297b2ad8c5dd0",
"assets/assets/images/wallpaper8.png": "42f8d6defc4115a70a6041ae5048d830",
"assets/assets/images/shareIcon.png": "2b1ab4594a78d3319a92b27b3469874c",
"assets/assets/images/gPay.jpg": "357e066e77cff4bf30e562bdc755a84a",
"assets/assets/images/Categories5.png": "a6d590e2bb33732b3d14480390644785",
"assets/assets/images/wallpaper10.png": "cc8101f84ed0fbbb21597ab20bd4e803",
"assets/assets/images/flamingo.png": "aede382e00fb59976eb1bd0699f40c40",
"assets/assets/images/Categories10.png": "0baabd4ba555ab883607f1ee8a850cfe",
"assets/assets/images/wallpaper11.png": "6ca924cc52e2a194f6b1b154835b4eaa",
"assets/assets/images/wallpaper13.png": "94ffa04342ded444ecb4c7acdda521b7",
"assets/assets/images/fb.png": "642437ceacb6fd6e8ecd2330deda7c1d",
"assets/assets/images/wallpaper12.png": "11c88b85faa81ba93d947ef9e8226039",
"assets/assets/images/spleashScrren.png": "c6b451cd3781db0e5a9e412c8447d545",
"assets/assets/images/image_placeHolder.png": "2c8f4a3ceb2a2054adf46138eb7172cb",
"assets/assets/images/SelectVectorIcon.png": "7c2abd044481d5661f26dc6377f10dfa",
"assets/assets/images/wallpaper15.png": "b3adbe3de2fa94e788216db568a877d7",
"assets/assets/images/imageLike.png": "00a634567eb128d8a70e92f6b89b7a76",
"assets/assets/images/wallpaperpre10.png": "dee4c35c971d7bb37fe10c7f09b3e4b8",
"assets/assets/images/VectorIcon.png": "cb507ae59b8ffad00ce37bd875cc661a",
"assets/assets/images/jio.png": "8b9123cb16cd32e5669cda11efbb3bc8",
"assets/assets/images/wallpaper14.png": "85c16e904937c20aeb2517745b42f5e7",
"assets/assets/images/backgroundImage.png": "4f357fbec048a44ca077c904afcaa1cd",
"assets/assets/images/DroverIcon.png": "19c940e0867f376d58adf089e13f6dcc",
"assets/assets/images/SelectFrameIcon.png": "9cf3185ce6c4381a7655d3f39fbf3383",
"assets/assets/images/docs.png": "52668af177aa289c92ca425bbf55f266",
"assets/assets/images/profileIcon.png": "7b80ebdb7ba1c3bfe3cda1dcba9d864e",
"assets/assets/images/phone.png": "74fbe0bcab1b884a0030fa188baddaa7",
"assets/assets/images/clock.png": "02db994a1d6096ab7ce991c96b176465",
"assets/assets/images/Categories8.png": "bdbab3f056e034a834621af331ccf7a4",
"assets/assets/images/categoriesIcon.png": "08830838e1b37a8e62e908d44dfa5b92",
"assets/assets/images/wallpaper5.png": "5d996faadff9bafdc69dac92dccf5864",
"assets/assets/images/pubg.jpg": "fb2fa4de0e6935eb621d5e2f0cbecdb9",
"assets/assets/images/playstore.png": "4e63347e82c16f5355f152a25afcb0ef",
"assets/assets/images/wallpaper4.png": "8651ba90c952696727e5806a5ca69d5c",
"assets/assets/images/botamBar.png": "bd3849d182a44c706fa44c1ca3cede92",
"assets/assets/images/draverLikeIcon.png": "0e1d3ed30c731d1f0a9dc7b974f7bbf8",
"assets/assets/images/youtube.png": "19b8821c675cf8b1173cdc697221a52b",
"assets/assets/images/Categories9.png": "d66b4e79a5fec32e6bf615a1535d49aa",
"assets/assets/images/LikeIcon.png": "500c37ce747c36d898a195b79a43da2e",
"assets/assets/images/lockIcon.png": "be448c6b8f736ba161e56a429da9287d",
"assets/assets/images/skyp.png": "7b46d6391aeb20ddfca77bae20772f03",
"assets/assets/images/wallpaper6.png": "97cb2d3a6f0fb103bf74fe44ce8ae8e6",
"assets/assets/images/wallpaper7.png": "a1819d8a51c4c2b404db627474c89bd7",
"assets/assets/images/LogOutIcon.png": "53f4691a6c8ef606e76e7733a75645de",
"assets/assets/images/wallpaper3.png": "6ab0002c1e3cb379ac913f52e3b47917",
"assets/assets/images/wallpaper2.png": "2c6139fbd8666cd066f22264e31f62c3",
"assets/assets/images/setting.png": "8a7e381aa3158e2ae0385d88611435fd",
"assets/assets/images/wp.png": "1227f7edc0704ff99f73e0425d85ab5d",
"assets/assets/images/bigLogutIcon.png": "28a9f8baa8abaecca764aa998f452c54",
"assets/assets/images/snapchat.png": "8c070483db755d438936d20cb4082c06",
"assets/assets/images/wallpaperpre9.png": "f84afea633a51d2a3b40a59e4f3d8f2a",
"assets/assets/images/wallpaper1.png": "4ce31a70ec703216b6616e71be872d29",
"assets/assets/images/FrameIcon.png": "b29091510d34b50d1598d976c8e1a9a4",
"assets/assets/images/wallpaperpre8.png": "7d429a0eec13b1e622f2ab003dfd9cf3",
"assets/assets/fonts/SF-Pro-Text-Black.otf": "82d5f38559f66d19b968066608f4a489",
"assets/assets/fonts/SF-Pro-Text-Regular.otf": "a07152f3f0c03589a75b218b2c6536cb",
"assets/assets/fonts/SF-Pro-Text-Bold.otf": "88b6e0b21919fa6abb7899faa1571f01",
"assets/assets/fonts/SF-Pro-Text-Thin.otf": "603fb2d8c5af2435e1532bf0d64b9a56",
"assets/assets/fonts/SF-Pro-Text-Semibold.otf": "9a7c849b216648913f216d20a21e9aae",
"assets/assets/fonts/SF-Pro-Text-Medium.otf": "ded5efe3e8ec62553c3b10f4edd4ca8d",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
