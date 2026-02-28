'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"favicon.png": "0b7c669df1e2781d42b8a12eed31dbc1",
"assets/AssetManifest.json": "e99eff9c79e33f6cd5d970fe02b0b5f0",
"assets/assets/files/saifulhassan_cv.pdf": "3ac6362f5163255728ed476125b9951e",
"assets/assets/images/profileimg.png": "0b7c669df1e2781d42b8a12eed31dbc1",
"assets/assets/images/projects/weather.png": "2021115cb60ea3137969f8a6d5b232e9",
"assets/assets/images/projects/book.png": "f3d0c7201247110db4cc1e5b71b7c394",
"assets/assets/images/projects/task.png": "bede6430fa1a2900bb08bc88cdbacc2b",
"assets/assets/images/projects/ecommerce.png": "347cf2f1886e14d89a27fd47a2da9fa1",
"assets/assets/images/projects/histomeet.png": "f60619cba8a55df9c81dae7cc7d8033e",
"assets/assets/images/projects/portfolio.png": "c1645ced94b5d327c64e872e5323d3bd",
"assets/assets/images/README.md": "8a02aa58aa69b27000ad29d010a44226",
"assets/assets/images/jpmorgan.png": "b78acdbc757b88800a5af239ebdf9e8f",
"assets/assets/images/oracle.png": "711beff870b5572676ab07edf4cf0aca",
"assets/assets/images/Profile.jpg": "10fdc540f4bae0782adb34cf455763ee",
"assets/assets/images/easports.png": "8966fab910a9cec07e8ebfee43ae2860",
"assets/assets/images/tech/vscode.svg": "be3fa252ce9d3ffce71db5b006ffea4a",
"assets/assets/images/tech/java.svg": "ea4d06205e1ac836e3ae534e6df58545",
"assets/assets/images/tech/bloc.svg": "e8ce99a65e4c81d488fb69687d4cbd70",
"assets/assets/images/tech/mysql.svg": "ae67e9f87758bc38ce3767002ed1fb85",
"assets/assets/images/tech/figma.svg": "efc5457e05de146d74ee3d348d10cd2a",
"assets/assets/images/tech/androidstudio.svg": "763c43415982ae470347d5ecda41a33e",
"assets/assets/images/tech/git.svg": "c03087a4bbd0e6416bef69c64230f505",
"assets/assets/images/tech/dart.svg": "702526fbf393808799c3c8b749fc3b28",
"assets/assets/images/tech/laravel.svg": "e27f0f9eb6e7b95443a6897d6b45211d",
"assets/assets/images/tech/firebase.svg": "604e0770eb020b9d61c51d1eff720269",
"assets/assets/images/tech/flutter.svg": "c609f4098ce89fbb7602cb68ab102164",
"assets/assets/images/Mindluster.png": "f8f7fda978c3082e48357316b392b0b1",
"assets/NOTICES": "73b3094c70629e5dc86ad4ecc5db72d2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "fcde165dbf2deeb489a8dcf0ce3a5695",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "91cf8d438ef28f698399aeee188ba84e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "af140bd220bf5ee2ec32cb93701eb737",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/AssetManifest.bin.json": "ad158dee05527a003ae3e329b79e2ec9",
"assets/fonts/MaterialIcons-Regular.otf": "9d3002a525e268141cf342afc7bb29e7",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "9c8051df39b3832e05d83e92d8f67fa1",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"index.html": "201429139289c83df71a6404f66243a9",
"/": "201429139289c83df71a6404f66243a9",
"manifest.json": "5fb2b4039ebe75e31c54c1227d6b6e9e",
"flutter_bootstrap.js": "da91f7f233af4eacd72e519b953d3fa3",
"main.dart.js": "b37b5948a2765ce8d4f20e79e11a6e61",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"version.json": "c420e205d8eac4ccea99913b4a50bfa7",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
