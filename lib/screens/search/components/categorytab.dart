import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/project_detail_page/project_detail_screen.dart';

class CategoryTab extends StatelessWidget {
  final String searchQuery;
  final List<Freelancer> freelancers;

  const CategoryTab({
    super.key,
    required this.searchQuery,
    required this.freelancers,
  });

  @override
  Widget build(BuildContext context) {
    final filteredProjects = freelancers
        .where((freelancer) =>
            freelancer.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
            freelancer.role.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.spaceBtwItems,
      ),
      child: filteredProjects.isEmpty
          ? _buildEmptyState(context)
          : ListView.builder(
              itemCount: filteredProjects.length,
              itemBuilder: (context, index) {
                final freelancer = filteredProjects[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProjectDetail(
                          projectId: '1',
                          title: "flutter developer",
                          description: "looking for flutter developer",
                          suggestedPrice: 200,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                    child: ProjectCard(freelancer: freelancer),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.work_outline, size: 64, color: Colors.grey[400]),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            'No projects found',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Text(
            searchQuery.isEmpty
                ? 'Check back later for new projects'
                : 'No matches for "$searchQuery"',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Freelancer freelancer;

  const ProjectCard({
    super.key,
    required this.freelancer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  child: Text(
                    freelancer.name.substring(0, 1),
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(width: TSizes.sm),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      freelancer.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      freelancer.role,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm,
                    vertical: TSizes.xs,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(TSizes.sm),
                  ),
                  child: Text(
                    freelancer.offeredPrice,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.green[800],
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.md),

            // Description (static for now)
            Text(
              'Project Title',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: TSizes.xs),
            Text(
              'Detailed project description would go here...',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: TSizes.md),

            // Skills
            Wrap(
              spacing: TSizes.xs,
              runSpacing: TSizes.xs,
              children: [
                _buildSkillChip('UI/UX', context),
                _buildSkillChip('Figma', context),
                _buildSkillChip('Prototyping', context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill, BuildContext context) {
    return Chip(
      label: Text(
        skill,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.blue[800],
            ),
      ),
      backgroundColor: Colors.blue[50],
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.sm),
      ),
      padding: const EdgeInsets.symmetric(horizontal: TSizes.xs),
      visualDensity: VisualDensity.compact,
    );
  }
}
