from PIL import Image, ImageDraw, ImageFont

# Figure 1 - Blue theme
img1 = Image.new('RGB', (800, 600), color='lightblue')
draw1 = ImageDraw.Draw(img1)
draw1.rectangle([50, 50, 750, 550], outline='darkblue', width=5)
# Use larger default font
try:
    font = ImageFont.truetype("arial.ttf", 36)
except:
    font = ImageFont.load_default()
draw1.text((400, 250), 'Figure 1 Placeholder', fill='darkblue', anchor='mm', font=font)
draw1.text((400, 320), 'Command Form Figure', fill='darkblue', anchor='mm', font=font)
draw1.text((400, 390), 'Hebrew Academic Template v5.0', fill='darkblue', anchor='mm', font=font)
img1.save('images/example-figure1.png')
print("Created images/example-figure1.png")

# Figure 2 - Green theme
img2 = Image.new('RGB', (800, 600), color='lightgreen')
draw2 = ImageDraw.Draw(img2)
draw2.rectangle([50, 50, 750, 550], outline='darkgreen', width=5)
draw2.text((400, 250), 'Figure 2 Placeholder', fill='darkgreen', anchor='mm', font=font)
draw2.text((400, 320), 'Environment Form Figure', fill='darkgreen', anchor='mm', font=font)
draw2.text((400, 390), 'Hebrew Academic Template v5.0', fill='darkgreen', anchor='mm', font=font)
img2.save('images/example-figure2.png')
print("Created images/example-figure2.png")

print("\nPlaceholder images created successfully!")
