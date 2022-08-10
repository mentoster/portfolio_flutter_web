'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"index.html": "fb9abcedd70f5c885d4ad6c9dcb01dac",
"/": "fb9abcedd70f5c885d4ad6c9dcb01dac",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "32deafeab7999b760c379eb46455e30c",
"manifest.json": "f4eaeeeabe842ae198d702553def1a2c",
"version.json": "19d57a8c3bc70c69f0d9f966afd2c94b",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-maskable-512.png": "46cb1c390d1c79d100495fa070695a68",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "e78f690d8d8f977a6dd430e96af81976",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "b7cf138d5f938de77237ffd389330ace",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/achievement.png": "1c11d54a28c8054d05af42debd2e55dc",
"assets/assets/images/timeline.png": "18bfec516795051a0556ee36b8b6bf72",
"assets/assets/images/projects/Revolit/background.png": "217221144ec3fbfcc0ec2abd911f221e",
"assets/assets/images/projects/Revolit/preview.png": "68195c6e6b60d171c510f6663d893a0c",
"assets/assets/images/achievement_projects.png": "94726633391bbeb17cedceae19c69479",
"assets/assets/images/me_photo.png": "e70fe28825aa43ae5a333efeec27e832",
"assets/assets/images/rocket.png": "3cd4a65c734bcf026aac8fd557c044e8",
"assets/assets/images/papers/diplomas/diploma_mai_2021.png": "8f473a1057e8afe8052ec4ef33253a1f",
"assets/assets/images/papers/diplomas/%25D0%25BF%25D1%2580%25D0%25BE%25D1%2580%25D1%258B%25D0%25B2_2020.png": "a79608af222289476f4aa2208e50e3dd",
"assets/assets/images/papers/diplomas/%25D1%2586%25D0%25B8%25D1%2584%25D1%2580%25D0%25BE%25D0%25B2%25D0%25BE%25D0%25B9_%25D0%25BF%25D1%2580%25D0%25BE%25D1%2580%25D1%258B%25D0%25B2_%25D0%25BF%25D1%2580%25D0%25BE%25D1%2580%25D1%258B%25D0%25B2_2021.png": "8b3e4dfa0d54d3ec3ebfa8fc503ffafd",
"assets/assets/images/papers/diplomas/junction_Dmitriy_Makarov%2520Asia-1.png": "0af65d365ea95281ceabbbb42a8ea2bd",
"assets/assets/images/papers/diplomas/%25D0%25A1%25D0%25B5%25D1%2580%25D1%2582%25D0%25B8%25D1%2584%25D0%25B8%25D0%25BA%25D0%25B0%25D1%2582%2520%25D1%2583%25D1%2587%25D0%25B0%25D1%2581%25D1%2582%25D0%25BD%25D0%25B8%25D0%25BA%25D0%25B0%2520%25D0%25A5%25D0%25B0%25D0%25BA%25D0%25B0%25D1%2582%25D0%25BE%25D0%25BD%25D0%25B0%2520%25D0%259C%25D0%25B0%25D0%25BA%25D0%25B0%25D1%2580%25D0%25BE%25D0%25B2%2520%25D0%259C%25D0%2598%25D0%25A0%25D0%25AD%25D0%2590.jpg": "d01186436e91f19f587019dd15b1d560",
"assets/assets/images/papers/diplomas/%25D1%2582%25D0%25B5%25D0%25BB%25D0%25B52_game_2019.png": "df03b0c4da7ca158ec1dd94315ee7674",
"assets/assets/images/papers/diplomas/junction_skysea_game-1.png": "d313012315cdb5c9553024c2103a648d",
"assets/assets/images/papers/diplomas/volvo_page-0001.jpg": "ef1f103d7eb9d58296d06e5a970aa3b4",
"assets/assets/images/papers/diplomas/%25D1%2586%25D0%25B8%25D1%2584%25D1%2580%25D0%25BE%25D0%25B2%25D0%25BE%25D0%25B9_%25D0%25BF%25D1%2580%25D0%25BE%25D1%2580%25D1%258B%25D0%25B2_2021-%25D1%2584%25D0%25B8%25D0%25BD%25D0%25B0%25D0%25BB.png": "3805c14fb1b053516bcfd99d5320b954",
"assets/assets/images/papers/diplomas/%25D0%25BB%25D0%25B8%25D0%25B4%25D0%25B5%25D1%2580%25D1%258B%2520%25D1%2586%25D1%258B%25D1%2584%25D1%2580.%2520%25D1%2582%25D1%2580%25D0%25B0%25D0%25BD%25D1%2581%25D1%2584%25D0%25BE%25D1%2580%25D0%25BC%25D0%25B0%25D1%2586%25D0%25B8%25D0%25B8.-1.png": "a5bf49b24e6c41e20eb1df605b8cbb9c",
"assets/assets/images/papers/diplomas/junction_Dmitriy_Makarov-1.png": "1ebd771bde01c22709757ea7730b7bdf",
"assets/assets/images/papers/certificates/%25D0%259C%25D0%25B0%25D0%25BA%25D0%25B0%25D1%2580%25D0%25BE%25D0%25B2%2520%25D0%2594%25D0%25BC%25D0%25B8%25D1%2582%25D1%2580%25D0%25B8%25D0%25B9%25202_page-0001.jpg": "88995ace0487b95a82ccb043cc5526f9",
"assets/assets/images/papers/certificates/%25D0%259C%25D0%25B0%25D1%2582%25D0%25B5%25D0%25BC%25D0%25B0%25D1%2582%25D0%25B8%25D0%25BA%25D0%25B0%2520%25D0%25B8%2520Python%2520%25D0%25B4%25D0%25BB%25D1%258F%2520%25D0%25B0%25D0%25BD%25D0%25B0%25D0%25BB%25D0%25B8%25D0%25B7%25D0%25B0%2520%25D0%25B4%25D0%25B0%25D0%25BD%25D0%25BD%25D1%258B%25D1%2585_page-0001.jpg": "8170eee56ea56a70be7bb2c4c1ff8316",
"assets/assets/images/papers/certificates/_OST_1_MIREA_IKBO_certificate_page-0001.jpg": "052d4df0cd85dde7124305238194e5a2",
"assets/assets/images/my_photo.png": "6fe91ac8d878fd9e64def3f400c507fa",
"assets/assets/icons/own_icons/connect.svg": "154d6f0747a4820205fdd4b4119e015c",
"assets/assets/icons/instruments/top_5/flutter.svg": "523c6bf154c2d65f90bec07c4b13dbbb",
"assets/assets/icons/instruments/top_5/dart.svg": "6e7593c192d73ff1d6646b77b65144a9",
"assets/assets/icons/instruments/top_5/figma.svg": "0066eec35c41a10a0847f15e097931e4",
"assets/assets/icons/instruments/top_5/vscode.svg": "b69d6ad0e628f7ffe618e367eec72415",
"assets/assets/icons/instruments/top_5/unity.svg": "cf4a496109df727cf890f273993e028b",
"assets/assets/icons/instruments/others/Cisco.svg": "abea80ce3085ab0ac2dbb541bac05c0f",
"assets/assets/icons/instruments/others/Linux.svg": "aca47fb546317341a14a647ba1470684",
"assets/assets/icons/instruments/others/Html.svg": "844e6c72286a9fbfc1a49e733a26b58b",
"assets/assets/icons/instruments/others/Python.svg": "63385f99c3e848ad6b29405f98fb9fdf",
"assets/assets/icons/instruments/others/Mysql.svg": "6610b9637ad92e99d542d63a0493cc6a",
"assets/assets/icons/instruments/others/C++.svg": "890c1673b900ad515f6dfbfc488f9bb1",
"assets/assets/icons/instruments/others/Digital_ocean.svg": "1c3ee4ad92ccfdc890b2a0d8baadaa23",
"assets/assets/icons/instruments/others/Hasura.svg": "9d38817f22be053d93a852972ed34b80",
"assets/assets/icons/instruments/others/Postresql.svg": "aef12b64a20370e2e3e5a44ac2d1e025",
"assets/assets/icons/instruments/others/Chrome.svg": "9c124885a16b1bbff0f43760b09ed351",
"assets/assets/icons/instruments/others/Dbeaver.svg": "77fc1d70fc6917567623452b7bf6b7cc",
"assets/assets/icons/instruments/others/Arch.svg": "2487c0b8f6f547bb7ca521aafc062a63",
"assets/assets/icons/instruments/others/Heroku.svg": "046e10f96e8cf2736f1bde6d199bb03a",
"assets/assets/icons/instruments/others/Atlassian.svg": "6a0a88ab1f7998e3e893ff5fe2b045bf",
"assets/assets/icons/instruments/others/Bash.svg": "67750ebdbe11410a6ef0d97579c8b613",
"assets/assets/icons/instruments/others/Photoshop.svg": "60cc9de337b09c917a03b29918ece2a0",
"assets/assets/icons/instruments/others/Css.svg": "f5637e6af1f534c39a2b030622f3d9f4",
"assets/assets/icons/instruments/others/Gitkraken.svg": "51512c0133d886b34d8f14eb6dd21554",
"assets/assets/icons/instruments/others/Php.svg": "c487eaed23fceeb2df8eecb4f662c23a",
"assets/assets/icons/instruments/others/Typescript.svg": "4625e2ea11365fd2599f67165d939846",
"assets/assets/icons/instruments/others/Docker.svg": "c98fcb10404995e3b3c8946f4aa7c2b3",
"assets/assets/icons/instruments/others/Firebase.svg": "cc9aa7a11b674ef65b7139e4da2d29fa",
"assets/assets/icons/instruments/others/Github.svg": "e751122ce716e1e484addc29dfabd236",
"assets/assets/icons/instruments/others/Git.svg": "701def9ce3c3fd14648e05cdcb8a03cd",
"assets/assets/icons/instruments/others/Django.svg": "91cea74da8d8b3c1206af82dddde8aa8",
"assets/assets/icons/instruments/others/Windows.svg": "6def60a4df892136751d40b073ce0a86",
"assets/assets/icons/instruments/others/Powershell.svg": "387a26ecc70bdc64473a1e08976429d0",
"assets/assets/icons/instruments/others/Javascript.svg": "4699ad9f36b71389bddb4d13be0c0639",
"assets/assets/icons/instruments/others/Fastapi.svg": "9df85e554947ead9e801ae6660894c7d",
"assets/assets/icons/abstract_figures/medals.svg": "2180e7d91f2e888bb025948e8d5f5185",
"assets/assets/icons/abstract_figures/blob4.svg": "1ed2c08cbc83232b590608000285b6a3",
"assets/assets/icons/abstract_figures/dog_and_stars.png": "2e9813a51c93a064b2c6fbd5290ebd74",
"assets/assets/icons/abstract_figures/blobsbehind.svg": "2efa446dcc407b4120084efa94fb90cd",
"assets/assets/icons/abstract_figures/blob1.svg": "481d76631e28441d86be38e6c01cbc0d",
"assets/assets/icons/abstract_figures/photo_background_blob1.svg": "1d69f33439ff5f563403bc1d03f2ca82",
"assets/assets/icons/abstract_figures/photo_background_blob2.svg": "d84b8c177fdad01fb37b8d0ae4fb6af3",
"assets/assets/icons/abstract_figures/projects.svg": "21857ace14d2b29b41d207b4d95743a1",
"assets/assets/icons/abstract_figures/blob3.svg": "935edd800f0cd06612731ce709af159b",
"assets/assets/icons/abstract_figures/degree.svg": "dacea43c89bb27e51fbdc1a3b95e4738",
"assets/assets/icons/abstract_figures/blob2.svg": "4791322125dedb26fea1e4a13defc356",
"assets/assets/icons/social_networks/github.svg": "4732f1af7fdaaf53274db9d0c68ade1b",
"assets/assets/icons/social_networks/vk.svg": "b9f8d4b06a7185e3048c46923b1cbd87",
"assets/assets/icons/social_networks/whatsapp.svg": "56b73c299a7cae34a04fbbf60293e975",
"assets/assets/icons/social_networks/telegram.svg": "116cf58e116402f7b007bddf9f77da47",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "75804d86099b28272ab4822960f7ae4e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
