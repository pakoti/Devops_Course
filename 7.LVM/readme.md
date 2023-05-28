# LVM (Logical Volume Manager)



<ul>
<li>1.PV (Physical Volume) </li>
<li>2.VG (Volume Group) </li>
<li>3.LV (Logical Volume) </li>
<li>4.PE (Physical Extent)</li>
<li>5.LE (Logical Extent)</li>
</ul>


# How to create extend LVM?
<p>we suppose that our PV (Physical Volume) </p>  

    fdisk
    pvcreate /dev/sdb2
    pvs
    vgextend data /dev/sdb2
    lvextend -l +255 /dev/data/lvol01
    xfs_growfs / resize2fs
    df -h

# How to decrease LV size?

    resize2fs /dev/data/lvol0 510M