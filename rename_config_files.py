from pathlib import Path

here = Path(__file__).parent
files = here.glob('**/yevis-config.yml')
for file in files:
    di = file.parent
    new_file = di.joinpath("yevis-metadata.yml")
    file.rename(new_file)
