import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectTitle),
      ),
      body: ListView.builder(
        itemCount: _applicants.length,
        itemBuilder: (context, index) {
          final applicant = _applicants[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(child: Text(applicant['name'][0])),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              applicant['name'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(applicant['role']),
                          ],
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
                        onPressed: () {
                          widget.onReject(index);
                          setState(() => _applicants.removeAt(index));
                        },
                        child: const Text('Reject',
                            style: TextStyle(color: Colors.red)),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          widget.onAccept(applicant);
                          setState(() => _applicants.removeAt(index));
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
