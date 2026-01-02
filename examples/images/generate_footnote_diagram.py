"""Generate diagram for footnote_example.tex."""
import matplotlib.pyplot as plt
import matplotlib.patches as patches

fig, ax = plt.subplots(figsize=(10, 6))
ax.set_xlim(0, 10)
ax.set_ylim(0, 6)

# Background
ax.set_facecolor('#F5F5F5')

# Main box
rect = patches.FancyBboxPatch((1, 1), 8, 4,
                               boxstyle="round,pad=0.05",
                               facecolor='white', edgecolor='#1976D2',
                               linewidth=3)
ax.add_patch(rect)

# Title
ax.text(5, 4.2, 'Diagram with Footnote', fontsize=18, fontweight='bold',
        ha='center', va='center', color='#1976D2')

# Subtitle
ax.text(5, 3.5, 'Footnote Example Figure', fontsize=14,
        ha='center', va='center', color='#666666')

# Decorative elements - three boxes
colors = ['#E3F2FD', '#BBDEFB', '#90CAF9']
for i, (x, color) in enumerate(zip([2, 4.5, 7], colors)):
    box = patches.FancyBboxPatch((x-0.8, 1.8), 1.6, 1.2,
                                  boxstyle="round,pad=0.02",
                                  facecolor=color, edgecolor='#1976D2',
                                  linewidth=1)
    ax.add_patch(box)
    ax.text(x, 2.4, f'Element {i+1}', fontsize=10,
            ha='center', va='center', color='#1976D2')

# Footnote indicator
ax.text(8.5, 4.2, '*', fontsize=14, fontweight='bold',
        ha='center', va='center', color='#D32F2F')

ax.axis('off')
plt.tight_layout()
plt.savefig('fig_footnote_diagram.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_footnote_diagram.png', bbox_inches='tight', dpi=300)
print("Generated: fig_footnote_diagram.pdf, fig_footnote_diagram.png")
