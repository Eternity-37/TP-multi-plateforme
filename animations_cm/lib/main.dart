import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationListScreen(),
    );
  }
}

class AnimationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final animations = [
      'Animation de taille (Implicit)',
      'Animation de position (Explicit)',
      'Rotation animée',
      'Transition entre écrans',
      'Effet de rebond avec Hero',
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Animations Flutter')),
      body: ListView.builder(
        itemCount: animations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(animations[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    switch (index) {
                      case 0:
                        return SizeAnimationScreen();
                      case 1:
                        return PositionAnimationScreen();
                      case 2:
                        return RotationAnimationScreen();
                      case 3:
                        return ScreenTransitionAnimationScreen();
                      case 4:
                        return HeroAnimationScreen();
                      default:
                        return SizedBox();
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SizeAnimationScreen extends StatefulWidget {
  const SizeAnimationScreen({super.key});

  @override
  State<SizeAnimationScreen> createState() => _SizeAnimationScreenState();
}

class _SizeAnimationScreenState extends State<SizeAnimationScreen> {
  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation de taille')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isBig = !isBig;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: isBig ? 200 : 100,
            height: isBig ? 200 : 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class PositionAnimationScreen extends StatefulWidget {
  const PositionAnimationScreen({super.key});

  @override
  State<PositionAnimationScreen> createState() =>
      _PositionAnimationScreenState();
}

class _PositionAnimationScreenState extends State<PositionAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(1.5, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation de position')),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Container(width: 100, height: 100, color: Colors.red),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class RotationAnimationScreen extends StatefulWidget {
  const RotationAnimationScreen({super.key});

  @override
  State<RotationAnimationScreen> createState() =>
      _RotationAnimationScreenState();
}

class _RotationAnimationScreenState extends State<RotationAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation de rotation')),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: const Icon(Icons.star, size: 100, color: Colors.yellow),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ScreenTransitionAnimationScreen extends StatelessWidget {
  const ScreenTransitionAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transition animée')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SecondScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) => FadeTransition(opacity: animation, child: child),
              ),
            );
          },
          child: const Text('Aller à l\'écran suivant'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Écran suivant')),
      body: const Center(child: Text('Bienvenue sur le second écran')),
    );
  }
}

class HeroAnimationScreen extends StatelessWidget {
  const HeroAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Effet de rebond')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HeroDetailScreen()),
            );
          },
          child: Hero(
            tag: 'hero-image',
            child: Container(width: 100, height: 100, color: Colors.purple),
          ),
        ),
      ),
    );
  }
}

class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détail')),
      body: Center(
        child: Hero(
          tag: 'hero-image',
          child: Container(width: 300, height: 300, color: Colors.purple),
        ),
      ),
    );
  }
}
