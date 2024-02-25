// Revox B780 Emulator
// 27.01.2024 Christian Lehner

#include <windows.h>
#include "resource.h"
#include <stdio.h>

const char g_szClassName[] = "myWindowClass";
HBITMAP hB70Bitmap;
HBRUSH hbrWhite, hbrGray;

// Step 4: the Window Procedure
LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
  switch(msg)
  {
    case WM_LBUTTONDOWN:    // <-
    {
      char szFileName[MAX_PATH];
      HINSTANCE hInstance = GetModuleHandle(NULL);

      GetModuleFileName(hInstance, szFileName, MAX_PATH);
      MessageBox(hwnd, szFileName, "This program is:", MB_OK | MB_ICONINFORMATION);
    }
    break;
    case WM_CREATE:
    {
      hbrWhite = GetStockObject(WHITE_BRUSH);
      hbrGray  = GetStockObject(GRAY_BRUSH);
    }
    break;                  // <-
    case WM_ERASEBKGND:
    {
      HDC hdc = (HDC) wParam;
      RECT rc;
      GetClientRect(hwnd, &rc);
      SetMapMode(hdc, MM_ANISOTROPIC);
      SetWindowExtEx(hdc, 100, 100, NULL);
      SetViewportExtEx(hdc, rc.right, rc.bottom, NULL);
      FillRect(hdc, &rc, hbrWhite);

      for (int i = 0; i < 13; i++)
      {
          int x = (i * 40) % 100;
          int y = ((i * 40) / 100) * 20;
          SetRect(&rc, x, y, x + 20, y + 20);
          FillRect(hdc, &rc, hbrGray);
      }
    }
    break;
    case WM_CLOSE:
      DestroyWindow(hwnd);
    break;
    case WM_DESTROY:
      DeleteObject(hB70Bitmap);
      PostQuitMessage(0);
    break;
    case WM_PAINT:
    {
      PAINTSTRUCT     ps;
      HDC             hdc;
      //BITMAP          bitmap;
      HDC             hdcMem;
      //HGDIOBJ         oldBitmap;

      hdc = BeginPaint(hwnd, &ps);

      hdcMem = CreateCompatibleDC(hdc);
      SelectObject(hdcMem, hB70Bitmap);

      BitBlt(hdc, 0, 0, 200, 200, hdcMem, 0, 0, SRCCOPY);

      DeleteDC(hdcMem);

      EndPaint(hwnd, &ps);
    }
    break;
    default:
        return DefWindowProc(hwnd, msg, wParam, lParam);
  }
  return 0;
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
    LPSTR lpCmdLine, int nCmdShow)
{
    WNDCLASSEX wc;
    HWND hwnd;
    MSG Msg;

    //Step 1: Registering the Window Class
    wc.cbSize        = sizeof(WNDCLASSEX);
    wc.style         = 0;
    wc.lpfnWndProc   = WndProc;
    wc.cbClsExtra    = 0;
    wc.cbWndExtra    = 0;
    wc.hInstance     = hInstance;
    wc.hIcon         = LoadIcon(NULL, IDI_APPLICATION);
    wc.hCursor       = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
    wc.lpszMenuName  = NULL;
    wc.lpszClassName = g_szClassName;
    wc.hIconSm       = LoadIcon(NULL, IDI_APPLICATION);

    if(!RegisterClassEx(&wc))
    {
        MessageBox(NULL, "Window Registration Failed!", "Error!",
            MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }

    // Step 2: Creating the Window
    hwnd = CreateWindowEx(
        WS_EX_CLIENTEDGE,
        g_szClassName,
        "Revox B780 Emulator by Christian Lehner",
        WS_OVERLAPPEDWINDOW | WS_SYSMENU,
        CW_USEDEFAULT, CW_USEDEFAULT, 800, 600,
        NULL, NULL, hInstance, NULL);

    if(hwnd == NULL)
    {
        MessageBox(NULL, "Window Creation Failed!", "Error!",
            MB_ICONEXCLAMATION | MB_OK);
        return 0;
    }

    ShowWindow(hwnd, nCmdShow);
    UpdateWindow(hwnd);

    // Load Bitmap
    //LPTSTR tmp = MAKEINTRESOURCE(IDB_B780);
    //printf("%s", MAKEINTRESOURCE(IDB_B780));
    //hB70Bitmap = LoadBitmap(hInstance, MAKEINTRESOURCE(IDB_B780));
    //printf("%d", hB70Bitmap);
    hB70Bitmap = LoadImage(hInstance, MAKEINTRESOURCE(IDB_B780),IMAGE_BITMAP, 0, 0, LR_DEFAULTSIZE);
    //printf("%d %d", hB70Bitmap, GetLastError());

    // Step 3: The Message Loop
    while(GetMessage(&Msg, NULL, 0, 0) > 0)
    {
        TranslateMessage(&Msg);
        DispatchMessage(&Msg);
    }
    return Msg.wParam;
}
