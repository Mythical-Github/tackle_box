
@echo off
set OUTPUT_DIR=%~dp0
set WRAPPER_NAME=tackle_plutonium_offline_installer
set DOWNLOAD_LINK=https://github.com/Mythical-Github/tackle_box/raw/refs/heads/main/tackle_packages/tackle_plutonium.zip
set ZIP_PATH="%OUTPUT_DIR%\downloaded_file.zip"
set UNZIPPED_FILES_DIR="%OUTPUT_DIR%\%WRAPPER_NAME%"

:: Download the file
echo Downloading file...
powershell -Command "Invoke-WebRequest -Uri '%DOWNLOAD_LINK%' -OutFile '%ZIP_PATH%'"
if %ERRORLEVEL% neq 0 (
    echo Download failed!
    pause
    exit /b
)

:: Unzip the file
echo Unzipping file...
powershell -Command "Expand-Archive -Path '%ZIP_PATH%' -DestinationPath '%OUTPUT_DIR%'"
if %ERRORLEVEL% neq 0 (
    echo Unzipping failed!
    pause
    exit /b
)

:: Delete the zip file
echo Deleting zip file...
del "%ZIP_PATH%"

"%CD%\%WRAPPER_NAME%.bat"

pause
