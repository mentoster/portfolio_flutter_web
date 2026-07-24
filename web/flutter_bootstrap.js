{{flutter_js}}
{{flutter_build_config}}

async function retireLegacyServiceWorker() {
  if (!('serviceWorker' in navigator)) {
    return true;
  }

  const cleanupKey = 'portfolio_flutter_web_service_worker_cleanup';
  if (sessionStorage.getItem(cleanupKey) === 'done') {
    return true;
  }

  const registrations = await navigator.serviceWorker.getRegistrations();
  const currentUrl = window.location.href;
  let removedController = false;

  for (const registration of registrations) {
    if (currentUrl.startsWith(registration.scope)) {
      const removed = await registration.unregister();
      removedController = removedController || removed;
    }
  }

  sessionStorage.setItem(cleanupKey, 'done');

  if (removedController && navigator.serviceWorker.controller) {
    window.location.reload();
    return false;
  }

  return true;
}

(async function startFlutter() {
  if (!await retireLegacyServiceWorker()) {
    return;
  }

  _flutter.loader.load({
    onEntrypointLoaded: async function (engineInitializer) {
      const loading = document.querySelector('#loading');
      if (loading) {
        loading.classList.add('main_done');
      }

      const appRunner = await engineInitializer.initializeEngine();

      if (loading) {
        loading.classList.add('init_done');
      }

      await appRunner.runApp();

      if (loading) {
        window.setTimeout(() => loading.remove(), 200);
      }
    },
  });
})();
