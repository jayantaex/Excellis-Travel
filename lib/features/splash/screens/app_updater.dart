import 'package:flutter/material.dart';
import 'package:excellistravel/core/utils/app_updater.dart';
import 'package:excellistravel/core/constants/app_constants.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_styles.dart';

class AppUpdaterScreen extends StatefulWidget {
  const AppUpdaterScreen({
    super.key,
    required this.latestVersion,
    required this.downloadUrl,
  });
  final String latestVersion;
  final String downloadUrl;

  @override
  State<AppUpdaterScreen> createState() => _AppUpdaterScreenState();
}

class _AppUpdaterScreenState extends State<AppUpdaterScreen>
    with SingleTickerProviderStateMixin {
  final AppUpdater _appUpdater = AppUpdater();
  bool _isDownloading = false;
  double _downloadProgress = 0.0;
  String _statusMessage = '';
  bool _downloadComplete = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  String _savePath = '';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.primaryColor.withOpacity(0.8),
                theme.primaryColor.withOpacity(0.6),
                Colors.deepPurple.shade300,
                Colors.blue.shade400,
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated Update Icon
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.system_update_alt_rounded,
                        size: 50,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Title
                  const Text(
                    'Update Available',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Subtitle
                  Text(
                    'A new version is ready to install',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Update Info Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Version Info
                        _buildInfoRow(
                          icon: Icons.new_releases_rounded,
                          label: 'Latest Version',
                          value: widget.latestVersion,
                          valueColor: Colors.greenAccent.shade200,
                        ),

                        const SizedBox(height: 16),

                        Divider(
                          color: Colors.white.withOpacity(0.3),
                          thickness: 1,
                        ),

                        const SizedBox(height: 16),

                        _buildInfoRow(
                          icon: Icons.phone_android_rounded,
                          label: 'Current Version',
                          value: AppConstants.appVersion,
                          valueColor: Colors.white.withOpacity(0.8),
                        ),
                        const SizedBox(height: 16),

                        InkWell(
                          onTap: () async {
                            await launchUrl(Uri.parse(widget.downloadUrl));
                          },
                          child: Text(
                            widget.downloadUrl,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Download Progress Section
                  if (_isDownloading) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Circular Progress Indicator
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: CircularProgressIndicator(
                                    value: _downloadProgress,
                                    strokeWidth: 6,
                                    backgroundColor:
                                        Colors.white.withOpacity(0.3),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.greenAccent.shade200,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${(_downloadProgress * 100).toInt()}%',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Status Message
                          Text(
                            _statusMessage,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Linear Progress Bar
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: _downloadProgress,
                              minHeight: 6,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.greenAccent.shade200,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          if (_downloadComplete) _buildCompleteButton(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],

                  // Download Button
                  if (!_isDownloading && !_downloadComplete)
                    _buildDownloadButton()
                  else
                    const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required Color valueColor,
  }) =>
      Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    color: valueColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _buildDownloadButton() => Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent.shade400,
              Colors.green.shade600,
            ],
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              setState(() {
                _isDownloading = true;
                _statusMessage = 'Downloading...';
              });
              _savePath = await _appUpdater.downloadApp(
                url: widget.downloadUrl,
                latestVersion: widget.latestVersion,
                onReceiveProgress: (received, total) {
                  if (total != -1) {
                    setState(() {
                      _downloadProgress = received / total;
                      if (_downloadProgress == 1) {
                        _statusMessage = 'Downloaded Success';
                        _downloadComplete = true;
                      }
                    });
                  }
                },
              );
            },
            borderRadius: BorderRadius.circular(25),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.download_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Download Update',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildCompleteButton() => Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade400,
              Colors.blue.shade700,
            ],
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              await OpenFilex.open(_savePath);
            },
            borderRadius: BorderRadius.circular(25),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Install the app',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
