import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {
  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  void _showPopup(BuildContext context, String imageName, String title, String subtitle, List<IconData> icons, List<String> texts, List<double> progressValues) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.white, // Set the background color to white
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F4530), // Title text color
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Divider(),
              SizedBox(height: 16.0),
              // Use a GridView to create a 3x3 layout for icons or progress indicators
              if (progressValues.isNotEmpty) ...[
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: progressValues.length,
                  itemBuilder: (context, index) {
                    return _buildProgressIndicatorWithText(progressValues[index], texts[index]);
                  },
                ),
              ] else ...[
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: icons.length,
                  itemBuilder: (context, index) {
                    return _buildIconWithText(icons[index], texts[index]);
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconWithText(IconData icon, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2F4530), // Background color for icons
          ),
          padding: EdgeInsets.all(8.0), // Padding inside the circular background
          child: Icon(
            icon,
            size: 32.0,
            color: Colors.white, // Icon color
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF2F4530), // Text color
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicatorWithText(double progressValue, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 70.0, // Adjust the width as needed
          height: 70.0, // Adjust the height as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2F4530), // Background color for progress indicators
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue / 100, // Set the progress value
                  strokeWidth: 5.0, // Adjust the stroke width as needed
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Indicator color
                ),
                Text(
                  '${progressValue.toInt()}%', // Display percentage in the center
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF2F4530), // Text color
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 1,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          String text;
          Color cardColor;
          Color textColor;
          String imageName;
          double progressValue;
          Color progressColor;
          String progressText;
          Color textColorForProgress;
          String popupTitle;
          String popupSubtitle;
          List<IconData> popupIcons;
          List<String> popupTexts;
          List<double> popupProgressValues;

          switch (index) {
            case 0:
              text = 'Tahap\nPemesanan';
              cardColor = Color(0xFF2F4530); // Dark green
              textColor = Colors.white; // White text color for the first card
              imageName = 'card1.png';
              progressValue = 1.0; // 100%
              progressColor = Color(0xFFFF5C5C); // Red color
              progressText = '100%';
              textColorForProgress = Colors.white; // White text color for the first card
              popupTitle = 'Tahap Pemesanan';
              popupSubtitle = 'Daftar menu tahap pemesanan';
              popupIcons = [Icons.monetization_on, Icons.wallet, Icons.history];
              popupTexts = ['Booking\nFree', 'Pesanan\nBelum Bayar', 'Riwayat\nPemesanan'];
              popupProgressValues = [];
              break;
            case 1:
              text = 'Tahap\nAdministrasi';
              cardColor = Color(0xFFF8F8F8); // Light gray
              textColor = Colors.black; // Black text color for other cards
              imageName = 'card2.png';
              progressValue = 0.5; // 50%
              progressColor = Color(0xFF334A34); // Dark green
              progressText = '50%';
              textColorForProgress = Colors.black; // Black text color for 50% progress
              popupTitle = 'Tahap Administrasi';
              popupSubtitle = 'Daftar menu tahap administrasi';
              popupIcons = [
                Icons.document_scanner, // Replace with the actual ruler icon
                Icons.edit, // Replace with the actual pen icon
                Icons.description, // Replace with the actual document icon
                Icons.description,
                Icons.description,
                Icons.description,
              ];
              popupTexts = [
                'Tahap\nSPS',
                'Tahap\nSPR',
                'Tahap\nPPJB',
                'Daftar\nDokumen',
                'Daftar\nSP3K',
                'Bayar\nAngsuran',
              ];
              popupProgressValues = [];
              break;
            case 2:
              text = 'Tahap\nPembangunan';
              cardColor = Color(0xFFF8F8F8); // Light gray
              textColor = Colors.black; // Black text color for other cards
              imageName = 'card3.png';
              progressValue = 0.0; // 0%
              progressColor = Colors.transparent; // No color
              progressText = '0%';
              textColorForProgress = Colors.black; // Default text color
              popupTitle = 'Tahap Pembangunan';
              popupSubtitle = 'Daftar menu tahap pembangunan';
              popupIcons = [];
              popupTexts = [];
              popupProgressValues = [5, 20, 30, 40, 5]; // Progress values for each indicator
              popupTexts = [
                'Tahap\nPersiapan',
                'Tahap\nPondasi & Struktur',
                'Tahap\nRumah Unfinished',
                'Tahap\nFinishing & Interior',
                'Tahap\nPembersihan',
              ];
              break;
            case 3:
              text = 'Tahap\nAkad & Serah';
              cardColor = Color(0xFFF8F8F8); // Light gray
              textColor = Colors.black; // Black text color for other cards
              imageName = 'card4.png';
              progressValue = 0.0; // 0%
              progressColor = Colors.transparent; // No color
              progressText = '0%';
              textColorForProgress = Colors.black; // Default text color
              popupTitle = 'Tahap Akad & Serah';
              popupSubtitle = 'Daftar menu tahap akad & serah';
              popupIcons = [Icons.handshake, Icons.description, Icons.assignment, Icons.assignment];
              popupTexts = ['Tahap\nAkad', 'Tahap\nserah Terima\nBangunan', 'Tahap\nSerah Terima\nBangunan','Daftar\komplain'];
              popupProgressValues = [];
              break;
            default:
              text = '';
              cardColor = Color(0xFFF8F8F8); // Default light gray
              textColor = Colors.black; // Default text color
              imageName = '';
              progressValue = 0.0; // Default to 0%
              progressColor = Colors.transparent; // Default color
              progressText = '0%'; // Default text
              textColorForProgress = Colors.black; // Default text color
              popupTitle = '';
              popupSubtitle = '';
              popupIcons = [];
              popupTexts = [];
              popupProgressValues = [];
          }

          return GestureDetector(
            onTap: () => _showPopup(context, imageName, popupTitle, popupSubtitle, popupIcons, popupTexts, popupProgressValues),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: cardColor, // Apply color
                  ),
                  Positioned(
                    left: 8.0,
                    top: 8.0,
                    child: Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8.0,
                    bottom: 8.0,
                    child: Image.asset(
                      'lib/assets/$imageName', // Path to your image assets
                      width: 140.0, // Adjust the width as needed
                      height: 140.0, // Adjust the height as needed
                    ),
                  ),
                  Positioned(
                    left: 8.0,
                    bottom: 8.0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50.0, // Adjust the width as needed
                          height: 50.0, // Adjust the height as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: progressValue, // Set the progress value
                              strokeWidth: 3.0, // Adjust the stroke width as needed
                              valueColor: AlwaysStoppedAnimation<Color>(progressColor), // Customize the color
                            ),
                          ),
                        ),
                        Text(
                          progressText,
                          style: TextStyle(
                            fontSize: 12.0, // Adjust the font size as needed
                            fontWeight: FontWeight.bold,
                            color: textColorForProgress, // Adjust color based on progress value
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
