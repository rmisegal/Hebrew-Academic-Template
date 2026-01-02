"""Generate basic figure placeholder image."""
import matplotlib.pyplot as plt
import matplotlib.patches as patches

fig, ax = plt.subplots(figsize=(10, 6))
ax.set_xlim(0, 10)
ax.set_ylim(0, 6)

# Background gradient effect
for i in range(60):
    color = plt.cm.Blues(0.2 + i * 0.01)
    rect = patches.Rectangle((0, i/10), 10, 0.1,
                               facecolor=color, edgecolor='none')
    ax.add_patch(rect)

# Add decorative elements
circle = patches.Circle((5, 3), 1.5, facecolor='lightblue',
                         edgecolor='navy', linewidth=3)
ax.add_patch(circle)

# Add text
ax.text(5, 3, 'Sample\nFigure', fontsize=24, fontweight='bold',
        ha='center', va='center', color='navy')
ax.text(5, 0.5, 'Basic Figure Example', fontsize=14,
        ha='center', va='center', color='gray')

ax.axis('off')
plt.tight_layout()
plt.savefig('fig_basic.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_basic.png', bbox_inches='tight', dpi=300)
print("Generated: fig_basic.pdf, fig_basic.png")
