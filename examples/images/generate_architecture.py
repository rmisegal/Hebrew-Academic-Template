"""Generate architecture diagram."""
import matplotlib.pyplot as plt
import matplotlib.patches as patches

fig, ax = plt.subplots(figsize=(12, 8))
ax.set_xlim(0, 12)
ax.set_ylim(0, 8)

# Layer boxes
layers = [
    (1, 6, 10, 1.5, 'Input Layer', '#E8F4FD', '#1E88E5'),
    (1, 3.5, 10, 1.5, 'Processing Layer', '#FFF3E0', '#FB8C00'),
    (1, 1, 10, 1.5, 'Output Layer', '#E8F5E9', '#43A047'),
]

for x, y, w, h, label, facecolor, edgecolor in layers:
    rect = patches.FancyBboxPatch((x, y), w, h,
                                   boxstyle="round,pad=0.05",
                                   facecolor=facecolor,
                                   edgecolor=edgecolor,
                                   linewidth=3)
    ax.add_patch(rect)
    ax.text(x + w/2, y + h/2, label, fontsize=16, fontweight='bold',
            ha='center', va='center', color=edgecolor)

# Arrows between layers
arrow_props = dict(arrowstyle='->', lw=3, color='#424242')
ax.annotate('', xy=(6, 6), xytext=(6, 5.1), arrowprops=arrow_props)
ax.annotate('', xy=(6, 3.5), xytext=(6, 2.6), arrowprops=arrow_props)

# Arrow labels
ax.text(6.5, 5.5, 'Data Flow', fontsize=10, va='center', color='gray')
ax.text(6.5, 3.0, 'Data Flow', fontsize=10, va='center', color='gray')

# Title
ax.text(6, 7.7, 'System Architecture', fontsize=18, fontweight='bold',
        ha='center', va='center', color='#1A237E')

ax.axis('off')
plt.tight_layout()
plt.savefig('fig_architecture.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_architecture.png', bbox_inches='tight', dpi=300)
print("Generated: fig_architecture.pdf, fig_architecture.png")
