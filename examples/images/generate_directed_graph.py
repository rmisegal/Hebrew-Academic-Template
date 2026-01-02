"""Generate directed graph (network diagram)."""
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np

fig, ax = plt.subplots(figsize=(10, 7))
ax.set_xlim(-1, 7)
ax.set_ylim(-3, 2)

# Node positions
nodes = {
    'A': (0, 0),
    'B': (3, 0),
    'C': (6, 0),
    'D': (1.5, -2),
    'E': (4.5, -2),
}

# Draw edges (arrows)
edges = [
    ('A', 'B'), ('B', 'C'), ('A', 'D'),
    ('B', 'D'), ('B', 'E'), ('C', 'E'), ('D', 'E'),
]

for start, end in edges:
    x1, y1 = nodes[start]
    x2, y2 = nodes[end]
    dx, dy = x2 - x1, y2 - y1
    length = np.sqrt(dx**2 + dy**2)
    dx, dy = dx/length * 0.5, dy/length * 0.5
    ax.annotate('', xy=(x2 - dx, y2 - dy), xytext=(x1 + dx, y1 + dy),
                arrowprops=dict(arrowstyle='->', lw=2, color='#424242'))

# Draw nodes
colors = ['#E3F2FD', '#E8F5E9', '#FFF3E0', '#FCE4EC', '#F3E5F5']
for i, (name, (x, y)) in enumerate(nodes.items()):
    circle = patches.Circle((x, y), 0.45, facecolor=colors[i],
                             edgecolor='#1565C0', linewidth=3)
    ax.add_patch(circle)
    ax.text(x, y, name, fontsize=16, fontweight='bold',
            ha='center', va='center', color='#1565C0')

ax.text(3, 1.5, 'Directed Graph', fontsize=16, fontweight='bold',
        ha='center', color='#1A237E')

ax.axis('off')
ax.set_aspect('equal')
plt.tight_layout()
plt.savefig('fig_graph.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_graph.png', bbox_inches='tight', dpi=300)
print("Generated: fig_graph.pdf, fig_graph.png")
