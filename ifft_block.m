function [iRGBb] = ifft_block(Fb_Y_mask, Fb_Cb_mask, Fb_Cr_mask)

%�
i_Y = blkproc(Fb_Y_mask, [8 8], 'ifftshift'); %ifftshift �� block 8x8 �� ���� ������ ��� ������� ���� ��� �������� ��� ������
iY = blkproc(i_Y, [8 8], 'ifft2');            %iFFT �� block 8x8 �� ���� ������ ��� ������� ���� ��� �������� ��� ifftshift
iYCbCr(:,:,1) = iY;                           %�������������� ��� ����� ��� ��������

%Cb
i_Cb = blkproc(Fb_Cb_mask, [8 8], 'ifftshift'); %ifftshift �� block 8x8 �� ���� ������ ��� ������� ���� ��� �������� ��� ������
iCb = blkproc(i_Cb, [8 8], 'ifft2');            %iFFT �� block 8x8 �� ���� ������ ��� ������� ���� ��� �������� ��� ifftshift
iYCbCr(:,:,2) = iCb;

%Cr
i_Cr = blkproc(Fb_Cr_mask, [8 8], 'ifftshift'); %ifftshift �� block 8x8 �� ���� ������ ��� ������� ���� ��� �������� ��� ������
iCr = blkproc(i_Cr, [8 8], 'ifft2');            %iFFT �� block 8x8 �� ���� ������ ��� ������� ���� ��� �������� ��� ifftshift
iYCbCr(:,:,3) = iCr;

iRGBb = ycbcr2rgb(iYCbCr);                     %��������� ���������� �����(��� YCbCr �� RGB)
figure,imshow(iRGBb),title('block-FFT image'); %���������� �������� ������������������ ������� (iRGB)


