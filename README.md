Continuous Integration Docker Image Base Packer Configuration
=============================================================

```bash
docker login
git clone https://github.com/neam/ci-base.packer-config.git ci-base
cd ci-base
git submodule update --init --recursive
packer build packer.json
```