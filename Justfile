build-release:
    cargo build --release

publish:
    cargo clippy --all-targets -- -D warnings
    cd balter-macros && cargo publish
    cd balter-core && cargo publish

basic-tps: mock-service
    cargo build --release --example basic-tps
    bash test-scripts/basic-test-runner.sh basic-tps

basic-saturate: mock-service
    cd examples/basic-examples && cargo build --release --example basic-saturate
    bash test-scripts/basic-test-runner.sh basic-saturate

gossip-test:
    cargo build --release --example distr-tps
    bash test-scripts/gossip-test-runner.sh

distr-tps: mock-service
    cargo build --release --example distr-tps
    bash test-scripts/distr-tps-test-runner.sh

distr-saturate: mock-service
    cargo build --release --example distr-saturate
    bash test-scripts/distr-saturate-test-runner.sh

mock-service:
    cargo build --release --bin mock-service
