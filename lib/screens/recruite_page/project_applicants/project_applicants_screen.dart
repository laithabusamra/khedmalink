import 'package:flutter/material.dart';
import 'package:khedma_link/screens/welcome/freelancer_recruiter/freelancer_profile_screen.dart';

class ProjectApplicantsScreen extends StatefulWidget {
  final String projectId;
  final String projectTitle;
  final String projectDescription;
  final String projectPrice;
  final List<Map<String, dynamic>> applicants;
  final Function(Map<String, dynamic>) onAccept;
  final Function(int) onReject;

  const ProjectApplicantsScreen({
    super.key,
    required this.projectId,
    required this.projectTitle,
    required this.projectDescription,
    required this.projectPrice,
    required this.applicants,
    required this.onAccept,
    required this.onReject,
  });

  @override
  State<ProjectApplicantsScreen> createState() =>
      _ProjectApplicantsScreenState();
}

class _ProjectApplicantsScreenState extends State<ProjectApplicantsScreen> {
  late List<Map<String, dynamic>> _applicants;

  @override
  void initState() {
    super.initState();
    _applicants = List.from(widget.applicants);
  }

  Future<bool?> _showConfirmationDialog(String action, String name) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$action Applicant'),
        content: Text('Are you sure you want to $action $name?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(action)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectTitle),
        backgroundColor: Colors.white,
      ),
      body: _applicants.isEmpty
          ? const Center(child: Text('No applicants left.'))
          : ListView.builder(
              itemCount: _applicants.length,
              itemBuilder: (context, index) {
                final applicant = _applicants[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Text(applicant['name'][0].toUpperCase()),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => FreelancerProfileScreen(
                                        phoneNumber: "07954798334",
                                        portfolioUrl:
                                            "https://exampleportfolio.com",
                                        name: applicant['name'],
                                        role: applicant['role'],
                                        offeredPrice: applicant['offeredPrice'],
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      applicant['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    Text(applicant['role']),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Offered Price: ${applicant['offeredPrice']}',
                          style: const TextStyle(color: Colors.green),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () async {
                                final confirm = await _showConfirmationDialog(
                                    'Reject', applicant['name']);
                                if (confirm == true) {
                                  widget.onReject(index);
                                  setState(() => _applicants.removeAt(index));
                                }
                              },
                              child: const Text(
                                'Reject',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () async {
                                final confirm = await _showConfirmationDialog(
                                    'Accept', applicant['name']);
                                if (confirm == true) {
                                  widget.onAccept(applicant);
                                  setState(() => _applicants.removeAt(index));
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Accept'),
                            ),
                          ],
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
