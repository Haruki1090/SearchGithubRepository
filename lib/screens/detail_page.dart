import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.repository});

  final Map<String, dynamic> repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          repository['full_name'],
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black), // Back button color
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.network(
                  repository['owner']['avatar_url'],
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 16.0),
              const Divider(),
              const SizedBox(height: 16.0),
              if (repository['description'] != null) ...[
                Text(
                  repository['description'],
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
              ],
              _buildInfoCard(
                context,
                icon: Icons.person,
                label: 'Owner',
                value: repository['owner']['login'],
              ),
              _buildInfoCard(
                context,
                icon: Icons.code,
                label: 'Language',
                value: repository['language'] ?? 'N/A',
              ),
              _buildInfoCard(
                context,
                icon: Icons.star,
                label: 'Stars',
                value: repository['stargazers_count']?.toString() ?? '0',
              ),
              _buildInfoCard(
                context,
                icon: Icons.remove_red_eye,
                label: 'Watchers',
                value: repository['watchers_count']?.toString() ?? '0',
              ),
              _buildInfoCard(
                context,
                icon: Icons.error_outline,
                label: 'Issues',
                value: repository['open_issues_count']?.toString() ?? '0',
              ),
              _buildInfoCard(
                context,
                icon: Icons.merge_type,
                label: 'pull_request',
                value: repository['pull_request']?.toString() ?? '0',
              ),
              _buildInfoCard(
                context,
                icon: Icons.call_split,
                label: 'Forks',
                value: repository['forks_count']?.toString() ?? '0',
              ),
              _buildInfoCard(
                context,
                icon: Icons.access_time,
                label: 'Created',
                value: repository['created_at']?.toString() ?? 'N/A',
              ),
              _buildInfoCard(
                context,
                icon: Icons.update,
                label: 'Updated',
                value: repository['updated_at']?.toString() ?? 'N/A',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required IconData icon, required String label, required String value}) {
    return Card(
      elevation: 2.0,
      surfaceTintColor: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
