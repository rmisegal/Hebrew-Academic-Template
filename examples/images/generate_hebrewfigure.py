"""Generate hebrewfigure command example."""
import matplotlib.pyplot as plt
import matplotlib.patches as patches

fig, ax = plt.subplots(figsize=(8, 5))
ax.set_xlim(0, 8)
ax.set_ylim(0, 5)

# Background pattern
for i in range(20):
    for j in range(13):
        circle = patches.Circle((i*0.4 + 0.2, j*0.4 + 0.2), 0.1,
                                  facecolor='#E3F2FD', edgecolor='none')
        ax.add_patch(circle)

# Central box
rect = patches.FancyBboxPatch((1, 1), 6, 3,
                               boxstyle="round,pad=0.1",
                               facecolor='white', edgecolor='#1565C0',
                               linewidth=3, alpha=0.9)
ax.add_patch(rect)

ax.text(4, 3, 'hebrewfigure', fontsize=20, fontweight='bold',
        ha='center', va='center', color='#1565C0', family='monospace')
ax.text(4, 2, 'Command Example', fontsize=14,
        ha='center', va='center', color='gray')

ax.axis('off')
plt.tight_layout()
plt.savefig('fig_hebrewfigure.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_hebrewfigure.png', bbox_inches='tight', dpi=300)
print("Generated: fig_hebrewfigure.pdf, fig_hebrewfigure.png")
