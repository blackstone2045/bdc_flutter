import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasources/post_remote_data_source.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/entities/post.dart';
import '../../domain/usecases/get_posts.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late final GetPosts getPosts;

  List<Post> posts = [];

  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    // Dependency initialization
    final dio = DioClient().dio;

    final remoteDataSource =
    PostRemoteDataSource(dio);

    final repository =
    PostRepositoryImpl(remoteDataSource);

    getPosts = GetPosts(repository);

    fetchPosts();
  }

  Future<void> fetchPosts() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final result = await getPosts();

      if (!mounted) return;

      setState(() {
        posts = result;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Application'),
        actions: [
          IconButton(
            onPressed: fetchPosts,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(errorMessage!),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: fetchPosts,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (posts.isEmpty) {
      return const Center(
        child: Text('No posts available'),
      );
    }

    return RefreshIndicator(
      onRefresh: fetchPosts,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${post.id}'),
              ),
              title: Text(post.title),
              subtitle: Text(post.body),
            ),
          );
        },
      ),
    );
  }
}