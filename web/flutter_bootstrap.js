{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  serviceWorkerSettings: {
    serviceWorkerVersion: {{flutter_service_worker_version}},
  },
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
