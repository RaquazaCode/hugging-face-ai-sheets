#  Copyright 2021-present, the Recognai S.L. team.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
import glob
import logging
import os
from pathlib import Path

logging.basicConfig(
    handlers=[logging.StreamHandler()],
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    level=logging.INFO,
    force=True,
)

_LOGGER = logging.getLogger("argilla.backup")

if __name__ == "__main__":
    backup_folder: str = "/data/argilla/backups/*"

    folders = glob.glob(backup_folder)
    folders.sort(key=os.path.getmtime, reverse=True)

    print(folders)

    if len(folders) > 1:
        safe_backup = folders[1]

        _LOGGER.info("Copying the second most recent backup to the argilla home folder")
        _LOGGER.info(os.listdir(os.getenv("ARGILLA_HOME_PATH")))
        _LOGGER.info(os.system(f"cp -r {safe_backup}/* $ARGILLA_HOME_PATH"))
        _LOGGER.info(os.listdir(os.getenv("ARGILLA_HOME_PATH")))
        _LOGGER.info("Backup restored!")
