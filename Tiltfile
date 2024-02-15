LOCAL_PATH = os.getenv("LOCAL_PATH", default='.')
NAMESPACE = os.getenv("NAMESPACE", default='default')
WAIT_TIMEOUT = os.getenv("WAIT_TIMEOUT", default='10m00s')
TYPE = os.getenv("TYPE", default='web')

k8s_custom_deploy(
    'tstest2',
    apply_cmd="tanzu apps workload apply -f tstest2-workload.yaml --update-strategy replace --debug --live-update" +
              " --local-path " + LOCAL_PATH +
              " --namespace " + NAMESPACE +
              " --wait-timeout " + WAIT_TIMEOUT +
              " --type " + TYPE +
              " --yes --output yaml",
    delete_cmd="tanzu apps workload delete -f tstest2-workload.yaml --namespace " + NAMESPACE + " --yes",
    deps=['pom.xml', './target/classes'],
    container_selector='workload',
    live_update=[
      sync('./target/classes', '/workspace/BOOT-INF/classes')
    ]
)

k8s_resource('tstest2', port_forwards=["8080:8080"],
            extra_pod_selectors=[{'carto.run/workload-name': 'tstest2','app.kubernetes.io/component': 'run'}])

allow_k8s_contexts('akslab3')