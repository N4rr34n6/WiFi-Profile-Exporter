# WiFi-Profile-Exporter

WiFi-Profile-Exporter is a PowerShell script designed to extract and export wireless network profiles along with their associated passwords and network adapter information on Windows systems. This tool is invaluable for network administrators, cybersecurity professionals, and users who need to manage and audit wireless network configurations efficiently.

## Unique Selling Points

- **Comprehensive Data Extraction**: WiFi-Profile-Exporter extracts all user wireless profiles and their associated security keys, providing a complete overview of the wireless networks configured on a device.

- **Multi-Format Export**: The script exports the collected data into structured CSV files, making it easy to analyze and share wireless network information.

- **User-Friendly Interface**: Designed for ease of use, the script outputs relevant information directly to the console, allowing users to quickly verify configurations before exporting.

- **Network Adapter Insights**: In addition to wireless profiles, the script gathers detailed information about network adapters, including MAC addresses and IP configurations, offering a holistic view of the network setup.

## Key Features

- **Wireless Network Profile Export**: Extracts SSID and passwords for all configured wireless networks and saves them in a CSV file.
- **Network Adapter Information**: Collects details about all network adapters, including their MAC addresses and IP addresses.
- **CSV File Generation**: Creates separate CSV files for wireless profiles (`WiFiProfiles.csv`) and network adapter information (`NetworkAdapters.csv`).

## Installation

To use WiFi-Profile-Exporter, a Windows operating system with PowerShell is required. No additional dependencies are needed.

1. Download the script `WiFi-Profile-Exporter.ps1`.
2. Open PowerShell with administrative privileges.
3. Navigate to the location of the script.
4. Execute the script with the following command:
   ```powershell
   .\WiFi-Profile-Exporter.ps1
   ```

## Prerequisites

- Windows 10 or later versions.
- Appropriate permissions to access wireless network profiles and network adapter configurations.

## Usage

Upon execution, the script performs the following actions:

1. Extracts all wireless network profiles and their associated passwords.
2. Outputs the SSID of each profile to the console for quick verification.
3. Exports the collected data into `WiFiProfiles.csv` and `NetworkAdapters.csv` files, which can be found in the same directory where the script is executed.

## Additional Configuration

No additional configurations are required; however, users may modify the output file names if desired within the script.

## Technical Details

The script employs the following processes:

1. **Profile Extraction**: Utilizes the `netsh` command to fetch all wireless profiles and their details, including SSID and security key.
2. **Adapter Information**: Gathers network adapter information using the `Get-NetAdapter` and `Get-NetIPAddress` cmdlets, compiling relevant details into structured objects.
3. **Data Export**: Exports the gathered information into two separate CSV files, ensuring clear organization of the data.

## License

This script is provided under the GNU Affero General Public License v3.0. You can find the full license text in the [LICENSE](LICENSE) file.

